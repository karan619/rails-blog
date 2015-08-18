class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts

  before_save :cap
  def cap
    name.capitalize!
  end

  def to_s
    name
  end
end
