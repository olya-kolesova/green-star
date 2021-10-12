class Jobseeker < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_trade_and_last_name_and_address_line3_and_post_code,
    against: [ :trade, :last_name, :address_line3, :post_code ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
