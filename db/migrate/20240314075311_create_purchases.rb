class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|

      t.timestamps
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
