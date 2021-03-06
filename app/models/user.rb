class User < ApplicationRecord
    has_secure_password
    has_many :favorites,dependent: :destroy
    has_many :losts,through: :favorites
    has_many :take_lessons,dependent: :destroy
    has_many :lessons,through: :take_lessons
    has_many :chats
    has_many :matters,dependent: :destroy

    validates :name, presence: true ,length: {minimum:1, maximum: 10 ,allow_blank: true}
    validates :faculty, presence: true ,length: {minimum:1, maximum: 10 ,allow_blank: true}
    validates :grade, presence: true  ,numericality: {only_integer: true,greater_than: 0,less_than: 5,allow_blank: true}
    #validates :admin, presence: true
    validates :password, presence: true,length: {minimum:1, maximum: 10 ,allow_blank: true}
    validates :email, email: {allow_blank: true}


    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|

      end
    end

  # 更新を許可するカラムを定義
    def self.update_multi
      ["name","student_id","faculty","grade","email","password","password_confirmation"]
    end
end
