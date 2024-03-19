require 'rails_helper'

RSpec.describe Shipping, type: :model do
  before do
    @shipping = FactoryBot.build(:shipping)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@shipping).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @shipping.building_name = ''
        expect(@shipping).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'address_numberが空だと購入できない' do
        @shipping.address_number = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Address number can't be blank")
      end
      it 'region_idが空だと購入できない' do
        @shipping.region_id = nil
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idが1だと購入できない' do
        @shipping.region_id = 1
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと購入できない' do
        @shipping.city = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと購入できない' do
        @shipping.street_number = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @shipping.phone_number = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @shipping.phone_number = '090123456789'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが英数混合だと購入できない' do
        @shipping.phone_number = '0901234567a'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end
      