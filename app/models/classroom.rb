class Classroom < ApplicationRecord
    has_many :lessons,dependent: :destroy
end
