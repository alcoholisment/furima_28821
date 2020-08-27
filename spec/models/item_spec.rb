require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "全ての必須フォームが入力されていれば出品できる" do
        expect(@item).to be_valid
      end
      it "商品名が40文字以下であれば出品できる" do
        
      end
      it "説明が1000文字以下であれば出品できる" do
        
      end
      it "価格が300〜9,999,999円以内であれば出品できる" do
        
      end
    end
  end
end
