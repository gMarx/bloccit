class Comment < ActiveRecord::Base
  has_many :commentings
  belongs_to :topic
  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
