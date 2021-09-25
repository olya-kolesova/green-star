class AddUserIdColumnToJobseekers < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobseekers, :user, null: false, foreign_key: true
  end
end
