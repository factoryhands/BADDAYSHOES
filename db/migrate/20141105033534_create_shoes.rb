class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.string :link

      t.timestamps
    end
  end
end
