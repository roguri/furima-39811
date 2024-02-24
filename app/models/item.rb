class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :region

  validates :title, :item_information, :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  validates :category_id, :condition_id, :shipping_cost_id, :shipping_date_id, :region_id, numericality: 
            { other_than: 1, message: "can't be blank" }
end
