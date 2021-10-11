class ReviewsController < ApplicationController
    before_action :logged_in_user

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @course = Course.find_by(id: params[:course_id])

    if @review.save
      flash[:success] = "Thank You For Your Review"
      redirect_back(fallback_location: @user)
    else
      flash[:danger] = "Limited 1 review per user!"
      redirect_back(fallback_location: @user)
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    @course = @review.course
  end

  def update
    @review = Review.find_by(id: params[:id])

    if @review.update(review_params)
      flash[:success] = "Review Updated"
      redirect_to @review.course
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review Deleted"
    redirect_back(fallback_location: @user)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :course_id, :content)
  end
end
