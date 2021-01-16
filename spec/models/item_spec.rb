require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context "商品が出品できる" do
      
      it '全ての必須項目が入力されており、各々の入力条件が全て満たされていると登録できる' do
        expect(@item).to be_valid
      end
    end
    
  end
end
