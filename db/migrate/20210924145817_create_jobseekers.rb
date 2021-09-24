class CreateJobseekers < ActiveRecord::Migration[6.0]
  def change
    create_table :jobseekers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :post_code
      t.string :phone_number
      t.string :email
      t.string :trade
      t.string :qualifications
      t.text :references
      t.text :enquiry

      t.timestamps
    end
  end
end
