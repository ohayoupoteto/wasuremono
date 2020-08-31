class Lesson < ApplicationRecord
    has_many :losts, dependent: :destroy
    belongs_to :classroom
    has_many :take_lessons,dependent: :destroy
    has_many :users,through: :take_lessons

    validates :name, presence: true ,uniqueness: true ,length: {minimum:1, maximum: 20 ,allow_blank: true}
    validates :teacher, presence: true ,length: {minimum:1, maximum: 10 ,allow_blank: true}
    

end
