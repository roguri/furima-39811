class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_cost_id
      t.integer :shipping_date_id
      t.integer :region_id
      t.text    :item_information
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
