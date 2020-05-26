class Like < ApplicationRecord
    validates :post_id,:user_id, {presence: true}
end
