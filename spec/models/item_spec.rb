require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it 'image,item_name,explanation,category_id,condition_id,delivery_fee_id,ship_from_area_id,prefecture_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが「---」だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが「---」だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'delivery_fee_idが「---」だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it 'ship_from_area_idが「---」だと登録できない' do
        @item.ship_from_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from area must be other than 1")
      end
      it 'prefecture_idが「---」だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下だと登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが9999999円以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは半角数字でなければ登録できない（全角の場合）' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは半角数字でなければ登録できない（数字以外の場合）' do
        @item.price = 'testTEST'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end