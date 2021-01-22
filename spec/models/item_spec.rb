require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できる場合' do
      it '全ての必須項目が入力されており、各々の入力条件が全て満たされていると出品できる' do
        expect(@item).to be_valid
      end

      it 'itemsが複数枚ある場合' do
        @item.images[0] = "public/images/test_image.png"
        @item.images[1] = "public/images/star.png"
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'nameが空の場合' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが41文字以上の場合' do
        @item.name = Faker::Lorem.sentence(word_count: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'imagesが空の場合' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end

      it 'descriptionが空の場合' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1001文字以上の場合' do
        @item.description = Faker::Lorem.sentence(word_count: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it 'category_idが1の場合' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力してください')
      end

      it 'condition_idが1の場合' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を入力してください')
      end

      it 'delivery_fee_idが1の場合' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee を入力してください')
      end

      it 'prefecture_idが1の場合' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を入力してください')
      end

      it 'days_taken_idが1の場合' do
        @item.days_taken_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days taken を入力してください')
      end

      it 'priceが空の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceに数字以外が入力された場合' do
        @item.price = '一万三千円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceの値が299以下の場合' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end

      it 'priceの値が10000000以上の場合' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end

      it 'userが紐づいていない場合' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
