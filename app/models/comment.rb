class Comment < ActiveRecord::Base
  belongs_to :post
  has_one :user, through: :post

  default_scope {order(created_at: :desc)}

  def to_s
    self.post.user.name
  end
end
