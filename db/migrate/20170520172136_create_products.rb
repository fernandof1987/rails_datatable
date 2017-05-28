class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :description
      t.references :product_subgroup, foreign_key: true
      t.decimal :cost_price, precision: 10, scale: 2
      t.decimal :sale_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
