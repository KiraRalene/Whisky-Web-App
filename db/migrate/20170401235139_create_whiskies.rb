class CreateWhiskies < ActiveRecord::Migration[5.0]
  def change
    create_table :whiskies do |t|
      t.string :name
      t.string :distillery
      t.integer :age
      t.string :cask
      t.string :kind
      t.float :abv
      t.integer :price
      t.string :image

      t.timestamps

      t.timestamps
    end
  end
end
