class Course < ApplicationRecord
  belongs_to :user
  has_many :users , through: :enrollment
  has_many :reviews
  has_many :videos
  enum category: {Technology: "Technology", Development: "Development", Bussiness: "Bussiness", OfficeProductivity: "OfficeProductivity", PersonalDevelopment: "PersonalDevelopment", Marketing: "Marketing", Fitness:"Fitness"}
end
