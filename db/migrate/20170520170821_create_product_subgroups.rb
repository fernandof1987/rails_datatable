class CreateProductSubgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :product_subgroups do |t|
      t.string :description
      t.references :product_group, foreign_key: true

      t.timestamps
    end
  end
end
