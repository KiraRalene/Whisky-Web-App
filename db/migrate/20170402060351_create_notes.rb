class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :rating
      t.string :color
      t.string :nose
      t.string :palate
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
