class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    #@course = current_user.courses.build course_params
    if @course.save
      flash[:success] = "Course is successfully registered"
      redirect_to courses_url
    else
      flash[:danger] = "Course was failed to be registered!"
      render :new
    end
  end

  def show
    @course = Course.find_by(id: params[:id])
    @apply = Apply.new
    @ids = @course.user_ids
  end

  def edit
    @course = Course.find_by(id: params[:id])
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.status == "Available"
      @course.destroy
      flash[:success] = "Course was deleted!"
      redirect_to courses_path
    else
      flash[:danger] = "Course already started/ended!"
      redirect_to courses_path
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.status == "Started"
      @course.started_at = Time.zone.now
    end

    if @course.update(course_params)
      flash[:success] = "Updated!"
      redirect_to @course
    else
      flash[:success] = "Error 404!"
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :total_month, :total_member)
  end
end
