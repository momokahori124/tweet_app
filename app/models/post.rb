class Post < ApplicationRecord
    # オブジェクトがDBに保存される前に、
    # そのデータが正しいかどうかを検証する仕組みをバリデーションという
    # validates :title, presence: true
    # validates :content, length: {maximum: 140}
    validates :content, {presence: true, length: {maximum: 140}}
end
