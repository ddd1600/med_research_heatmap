class AddZAAndBVarEtc < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :z_var_name, :string
    add_column :data_rows, :z_var, :float
    add_column :spreadsheets, :a_var_name, :string
    add_column :data_rows, :a_var, :float
    add_column :spreadsheets, :b_var_name, :string
    add_column :data_rows, :b_var, :string
    add_column :spreadsheets, :c_var_name, :string
    add_column :data_rows, :c_var, :string
  end
end
