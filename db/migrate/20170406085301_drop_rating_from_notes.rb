class DropRatingFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :notes, :rating
  end
end
