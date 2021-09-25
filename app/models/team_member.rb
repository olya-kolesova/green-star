class TeamMember < ApplicationRecord
  belongs_to :user
  validates :first_name
  validates :last_name
end
