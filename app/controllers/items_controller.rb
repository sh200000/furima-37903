class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save  
      #if @item.image.attached?
        redirect_to root_path
      #else
        #@item.destroy
        #render :new
      #end
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id, 
      :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
