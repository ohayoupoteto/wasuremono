class User < ApplicationRecord
    has_secure_password
    has_many :favorites,dependent: :destroy
    has_many :losts,through: :favorites
    has_many :take_lessons,dependent: :destroy
    has_many :lessons,through: :take_lessons
end
