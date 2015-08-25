class SearchSuggestionsController < ApplicationController
  protect_from_forgery :except => :index
  def index
    render json: Post.where("title ilike ? or content ilike ?", "%#{params[:term]}%", "%#{params[:term]}%").pluck(:title)
  end
end
