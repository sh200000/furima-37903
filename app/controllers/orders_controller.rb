class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if Order.exists?(item_id: @item.id) || @item.user == current_user
      redirect_to root_path 
    end
    @order_shiping = OrderShipping.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shiping = OrderShipping.new(order_params)
    if @order_shiping.valid?
      pay_item
      @order_shiping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone).merge(token: params[:token], user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end
end
