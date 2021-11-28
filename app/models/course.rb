class Course < ApplicationRecord
  belongs_to :user
  has_many :users , through: :enrollment
  has_many :reviews
  has_many :videos
end
