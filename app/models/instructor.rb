class Instructor < User
    has_and_belongs_to_many :courses, association_foreign_key: :user_id
end
