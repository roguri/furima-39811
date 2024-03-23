class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :shipping

  validates :item_id, :user_id, presence: true

  def self.purchase(item_id, user_id)
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(purchase_id: purchase.id)
  end
end
