class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def user
    return User.find_by(id: self.user_id)
  end
end
