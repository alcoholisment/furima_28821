require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品出品' do
    context '出品がうまくいく時' do
      it '画像、商品名、説明、---以外のプルダウン、価格が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品名が40文字以下であれば出品できる' do
        @item.name = 'あ' * 40
        expect(@item).to be_valid
      end
      it '商品の説明が1000文字以下であれば出品できる' do
        @item.info = 'あ' * 1000
        expect(@item).to be_valid
      end
      it '価格が300円以上であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '価格が9,999,999円以下であれば出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '出品がうまくいかない時' do
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが---だと出品できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre must be other than 1')
      end
      it '商品の状態が---だと出品できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 1')
      end
      it '配送料の負担が---だと出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
      end
      it '発送元の地域が---だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が---が出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end
      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格が300円未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '価格が10,000,000円以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end
  end
end
