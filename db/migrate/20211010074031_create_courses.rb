class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :courses, [:user_id, :created_at]
  end
end
