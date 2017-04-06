class AddDetailsColumnToWhiskies < ActiveRecord::Migration[5.0]
  def change
    add_column :whiskies, :details, :text 
  end
end
