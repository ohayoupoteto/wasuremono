class User < ApplicationRecord
    has_many: favorites
    has_many: losts,through: :favorites

    has_many: take_lessons
    has_many: lessons,through: :take_lessons
end
