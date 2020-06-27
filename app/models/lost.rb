class Lost < ApplicationRecord
    belongs_to :lesson

    has_many :favorites
    has_many :users,through: :favorites
end
