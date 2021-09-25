class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.text :info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
