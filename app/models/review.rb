class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :enrollment
end
