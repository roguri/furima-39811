require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'item_idが空だと購入できない' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
