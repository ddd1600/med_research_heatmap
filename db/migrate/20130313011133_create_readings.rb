class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :drug_name
      t.float :result
      t.text :notes
      t.references :test
      t.references :subject

      t.timestamps
    end
    add_index :readings, :test_id
    add_index :readings, :subject_id
  end
end
