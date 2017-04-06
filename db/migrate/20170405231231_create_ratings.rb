class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :whisky
      t.references :note
      t.integer :score

      t.timestamps
    end
  end
end
