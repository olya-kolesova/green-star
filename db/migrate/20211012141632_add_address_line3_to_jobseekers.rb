class AddAddressLine3ToJobseekers < ActiveRecord::Migration[6.0]
  def change
    add_column :jobseekers, :address_line3, :string
  end
end
