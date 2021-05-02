require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it 'postal_cord, prefecture_id, city, word, phone_number, tokenがあれば登録できる' do
        expect(@purchase_form).to be_valid
      end
      it 'buildingが空でも保存ができる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_cordが空だと登録できない' do
        @purchase_form.postal_cord = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal cord can't be blank")
      end
      it 'prefecture_idが「---」だと登録できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと登録できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'wordが空だと登録できない' do
        @purchase_form.word = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Word can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと登録できない' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_cordがハイフンが無いと登録できない' do
        @purchase_form.postal_cord = '0000000'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal cord is invalid")
      end
      it 'phone_numberがハイフンが入っていると登録できない' do
        @purchase_form.phone_number = '000-0000-0000'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと登録できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
