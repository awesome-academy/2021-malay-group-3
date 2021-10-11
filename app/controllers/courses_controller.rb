class CoursesController < ApplicationController
  before_action :logged_in_user

  def index
    @courses = Course.all
  end

  def show
    @user = @current_user
    @course = Course.find_by(id: params[:id])
    @register = Register.new
    @review = Review.new
    @ids = @course.user_ids
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = "New Course Created"
      redirect_to @course
    else
      flash[:danger] = "Failed to Create New Course"
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.status == "Started"
      @course.started_at = Time.zone.now
    end

    if @course.update(course_params)
      flash[:success] = "Course Updated"
      redirect_to @course
    else
      flash[:success] = "Failed to Update Course"
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.status == "Opening"
      @course.destroy
      flash[:success] = "Course Successfully Deleted"
      redirect_to courses_path
    else
      flash[:danger] = "Deletion Fail Error : Course in progress/finished!"
      redirect_to courses_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :status, :total_month, :started_at)
  end
end
