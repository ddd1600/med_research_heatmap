class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :notes
      t.references :reading

      t.timestamps
    end
    add_index :subjects, :reading_id
  end
end
