class PostsController < ApplicationController
  before_action :verify_logged_in?, only: [:new, :create]
  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
