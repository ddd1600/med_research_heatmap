class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|
      t.string :name
      t.string :x_var_name
      t.string :y_var_name
      t.text :source

      t.timestamps
    end
  end
end
