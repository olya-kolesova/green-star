class Project < ApplicationRecord
  validates :name, uniqueuness: true, presence: true
  validates :location, presence: true
end
