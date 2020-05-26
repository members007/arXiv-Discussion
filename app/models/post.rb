class Post < ApplicationRecord
    validates :content,:user_id,:year,:no , {presence: true}
    validates :content, {length: {maximum: 5000}}
    def user
        return User.find_by(id: self.user_id)
    end
    def count
        @post = Post.find_by(id: self.id)
        @count = Like.where(post_id: @post.id)
        return @count.all.count
    end
end
