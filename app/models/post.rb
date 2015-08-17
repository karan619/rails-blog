class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  VALID_SCRIPT = /(<script src=("|')https:\/\/gist\.github\.com\/\S+\.js("|')>)(<\/script>)/
  before_save :validate_script

  default_scope {order(created_at: :desc)}
  scope :al, -> {Post.joins(:user, :comments).select("posts.*, COUNT(comments.id) as comment_count, users.name as user_name").group("posts.id")}
  def validate_script
    content.scan(/<script.*>.*<\/script>/i).each do |c|
       self.content[c] = '' unless c.match(VALID_SCRIPT)
    end
  end

  def method_name

  end
end
