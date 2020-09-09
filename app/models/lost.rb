class Lost < ApplicationRecord
    belongs_to :lesson
    has_many :favorites,dependent: :destroy
    has_many :users,through: :favorites
    has_many :matters, dependent: :destroy

    has_one_attached :lost_picture
    attribute :new_lost_picture

    validates :name, presence: true ,length: {minimum:1, maximum: 20 ,allow_blank: true}
    validates :detail, presence: true,length: {minimum:1, maximum: 100 ,allow_blank: true}
    validates :category, length: {minimum:1, maximum: 10 ,allow_blank: true}
    before_save do
        if new_lost_picture
            self.lost_picture= new_lost_picture
        end
    end
end
