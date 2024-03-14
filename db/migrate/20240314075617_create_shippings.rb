class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.references :purchase, foreign_key: true
      t.string :postal_number, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :street_number, null: false
      t.string :building_name
      t.string :phone_number, null: false
    end
  end
end
