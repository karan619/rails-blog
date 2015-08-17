class PostsController < ApplicationController
  before_action :verify_logged_in?, only: [:new, :create, :destroy, :update]
  def new
    @post = current_user.posts.build
  end

  def create
    if current_user().posts.create(post_params)
      redirect_to root_url
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

  def content
    @post = Post.find(params[:id])
    @content = @post.content
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js do
        if @post.user.id != current_user().id
          render js: 'Materialize.toast("That is not your post, OK?", 3000);'
        else
          @post.destroy!
        end
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js do
        if @post.user.id != current_user().id
          render js: 'Materialize.toast("That is not your post, OK?", 3000);'
        else
          @post.update_attributes(post_params)
        end
      end
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
