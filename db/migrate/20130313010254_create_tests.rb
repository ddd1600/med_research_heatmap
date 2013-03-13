class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :user
      t.string :name
      t.date :date
      t.text :notes

      t.timestamps
    end
    add_index :tests, :user_id
  end
end
