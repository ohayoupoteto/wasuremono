class Classroom < ApplicationRecord
    has_many :lessons,dependent: :destroy

    validates :name, presence: true ,uniqueness: true ,length: {minimum:1, maximum: 20 ,allow_blank: true}

end
