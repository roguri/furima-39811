require 'rails_helper'

RSpec.describe Shipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@purchase_form).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it '郵便番号がないと購入できない' do
        @purchase_form.address_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address number can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_form.address_number = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address number is invalid. Include hyphen(-)")
      end
      it '都道府県がないと購入できない' do
        @purchase_form.region_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Region can't be blank")
      end
      it '都道府県が1だと購入できない' do
        @purchase_form.region_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村がないと購入できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと購入できない' do
        @purchase_form.street_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号がないと購入できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できない' do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @purchase_form.phone_number = '123456789012'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が英数字混合だと購入できない' do
        @purchase_form.phone_number = '1234567890a'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンがないと購入できない' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end