class Project < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :location, presence: true
end
