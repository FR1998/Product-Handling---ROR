class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :quantity
      t.float :price
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
