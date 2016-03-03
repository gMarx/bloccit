class SponsoredPost < ActiveRecord::Base
  belongs_to :topic

  validates :title, length: { minimum: 3 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :price, presence: true
end
