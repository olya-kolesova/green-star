class Project < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :location, presence: true
  has_one_attached :photo
end
