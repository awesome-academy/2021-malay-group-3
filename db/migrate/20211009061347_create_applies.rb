class CreateApplies < ActiveRecord::Migration[6.1]
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :status

      t.timestamps
    end
  end
end
