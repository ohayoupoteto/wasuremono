class Chat < ApplicationRecord
    belongs_to :user

    validates :sentence, presence: true,length: {minimum:1, maximum: 100 ,allow_blank: true}

end
