class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @course = current_user.courses.build course_params
    if @course.save
      flash[:success] = t(:course_created)
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(params[:page])
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] =
    else
      flash[:danger] = "Deleted fail"
    end
    redirect_to request.referer || root_url
  end

  private

  def course_params
  params.require(:course).permit :content
  end
end
