class CreateTestsSubjects < ActiveRecord::Migration
  def change
    create_table :tests_subjects, :id => false do |t|
      t.integer :test_id
      t.integer :subject_id
    end
  end
end
