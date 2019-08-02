class AddUserAndCourseIdToEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :course_id, :integer
    add_column :enrollments, :user_id, :integer
    add_index :enrollments, [:user_id, :course_id]
    add_index :enrollments, :course_id
  end
end
