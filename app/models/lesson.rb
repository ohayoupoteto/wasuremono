class Lesson < ApplicationRecord
    has_many :losts,dependent: :destroy
    belongs_to :classroom

    has_many :take_lessons,dependent: :destroy
    has_many :users,through: :take_lessons
end
