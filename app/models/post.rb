class Post < ApplicationRecord
    # オブジェクトがDBに保存される前に、
    # そのデータが正しいかどうかを検証する仕組みをバリデーションという
    # validates :title, presence: true
    # validates :content, length: {maximum: 140}
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}

    # 投稿のuser_idを返す関数
    def user
        return User.find_by(id: self.user_id)
    end
end
