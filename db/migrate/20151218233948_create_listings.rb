class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :street
      t.string :status
      t.integer :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :sq_ft
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
