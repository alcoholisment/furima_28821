require 'rails_helper'

RSpec.describe ItemTransaction, type: :model do
  describe '購入情報の保存' do
    before do
      @item_transaction = FactoryBot.build(:item_transaction)
    end
    it 'すべての配送先が正しく入力されていれば保存できる' do
      expect(@item_transaction).to be_valid
    end
    it 'buildingが空でも保存できる' do
      @item_transaction.building = nil
      expect(@item_transaction).to be_valid
    end
    it 'postal_codeが空だと保存できない' do
      @item_transaction.postal_code = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
    it 'postal_codeに-が入っていないと保存できない' do
      @item_transaction.postal_code = '1111111'
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefecture_idが1だと保存できない' do
      @item_transaction.prefecture_id = 1
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空だと保存できない' do
      @item_transaction.city = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できない' do
      @item_transaction.address = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できない' do
      @item_transaction.phone_number = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberに-が入っていると登録できない' do
      @item_transaction.phone_number = 000-1111-1111
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
