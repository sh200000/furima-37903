require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_shipping.telephone = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telephoneが9桁以下では購入できない' do
        @order_shipping.telephone = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'telephoneが12桁以上では購入できない' do
        @order_shipping.telephone = '123456789123'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'telephoneに半角数字以外が含まれている場合は購入できない' do
        @order_shipping.telephone = '123456789１'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空だと保存できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
