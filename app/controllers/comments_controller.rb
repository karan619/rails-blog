class CommentsController < ApplicationController
  before_action :verify_logged_in?, only: [:new, :create, :delete]
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(name: @current_user)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    respond_to do |format|
      format.js
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    respond_to do |format|
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:name, :comment, :post_id)
  end
end
