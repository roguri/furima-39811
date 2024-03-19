class Shipping < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  with_options presence: true do
    validates :address_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }, length: { maximum: 11 }
  end
end
