class AddUserIdToSpreadsheets < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :user_id, :integer
  end
end
