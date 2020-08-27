class Lost < ApplicationRecord
    belongs_to :lesson
    has_many :favorites,dependent: :destroy
    has_many :users,through: :favorites
    has_many :matters,dependent: :destroy
end
