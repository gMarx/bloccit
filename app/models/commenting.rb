class Commenting < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end