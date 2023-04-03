class ReviewsController < ApplicationController
  before_action :set_list, only: [:create]

  def new
    # @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    # @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      # @bookmark = Bookmark.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
