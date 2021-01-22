require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入機能' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context '購入できる' do
      it '全ての必須項目が入力されており、各々の入力条件が全て満たされている場合' do
        expect(@item_order).to be_valid
      end
      it 'buildingが空の場合' do
        expect(@item_order).to be_valid
      end
    end

    context '購入できない' do
      it 'postal_codeが空の場合' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが含まれていない場合' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code はハイフンを含めてください")
      end

      it 'prefecture_idが1の場合' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture を入力してください")
      end

      it 'areaが空の場合' do
        @item_order.area = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Area can't be blank")
      end

      it 'addressが空の場合' do
        @item_order.address = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空の場合' do
        @item_order.phone = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが12桁以上の場合' do
        @item_order.phone = '123456789123'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone は11桁以内の数字を入力してください")
      end

      it 'phoneが全角文字の場合' do
        @item_order.phone = 'アイウエオ'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone は11桁以内の数字を入力してください')
      end

      it 'phoneが英数混在の場合' do
        @item_order.phone = '123abc456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone は11桁以内の数字を入力してください')
      end

      it 'tokenが空の場合' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空の場合' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空の場合' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
