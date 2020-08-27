class Matter < ApplicationRecord
    belongs_to :user
    belongs_to :lost, optional: true #ここを追加
end
