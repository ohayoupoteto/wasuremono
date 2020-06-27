class Lesson < ApplicationRecord
    has_many :losts
    belongs_to :classroom

    has_many :take_lessons
    has_many :users,through: :take_lessons
end
