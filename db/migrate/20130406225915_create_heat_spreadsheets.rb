class CreateHeatSpreadsheets < ActiveRecord::Migration
  def change
    create_table :heat_spreadsheets do |t|
      t.text :source
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :heat_spreadsheets, :user_id
  end
end
