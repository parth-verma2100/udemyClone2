class User < ApplicationRecord
  extend Devise::Models
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses ,through: :enrollment
  has_many :reviews
  has_one :enrollment 
  validates :name, presence: true
  enum user_role: {Instructor: "Instructor", Student: "Student"}
  scope :instructor, -> { where(role: 'instructor') } #not understood
  scope :student, -> { where(role: 'student') }        
end
