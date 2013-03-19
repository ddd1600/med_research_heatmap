class CreateDataRows < ActiveRecord::Migration
  def change
    create_table :data_rows do |t|
      t.string :name
      t.float :x_var
      t.float :y_var
      t.references :spreadsheet

      t.timestamps
    end
    add_index :data_rows, :spreadsheet_id
  end
end
