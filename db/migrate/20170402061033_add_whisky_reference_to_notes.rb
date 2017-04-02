class AddWhiskyReferenceToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :whisky, foreign_key: true
  end
end
