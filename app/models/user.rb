class User < ApplicationRecord
    validates :name,:email,:password, {presence: true}
    validates :name,:email, {uniqueness: true}
    def posts
        return Post.where(user_id: self.id)
    end 
end
