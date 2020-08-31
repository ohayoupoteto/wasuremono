class Matter < ApplicationRecord
    belongs_to :user
    belongs_to :lost, optional: true

    #Mvalidates :eve, length: {minimum:1, maximum: 100 ,allow_blank: true}
    #validates :is_solved, presence: true

end
