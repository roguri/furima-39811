class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_number, :region_id, :city, :street_number, :building_name, :phone_number, :item_id, :user_id, :token

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_number: postal_number, region_id: region_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :token
  end
end