class RegistersController < ApplicationController
  before_action :logged_in_user

  def new
    @register = Register.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @course = Course.find_by(id: params[:course_id])
    @register = Register.new(register_params)

    if @register.save
      flash[:info] = "Waiting Approval for Enrollment"
      redirect_back(fallback_location: @user)
    else
      flash[:danger] = "Registration failed Error : You Already Register this course"
      redirect_back(fallback_location: @user)
    end
  end

  def edit
    @register = Register.find(params[:id])
  end

  def update
    @course = Course.find_by(params[:id])
    @register = Register.find(params[:id])

    if @register.update(register_params)
      flash[:success] = "Updated"
      redirect_to @register.course
    else
      flash[:danger] = "Failed to Update"
      render :edit
    end
  end

  def destroy
    @register = Register.find(params[:id])
    @register.destroy
    flash[:success] = "Removed from Enrollment"
    redirect_back(fallback_location: @user)
  end

  private

  def register_params
    params.require(:register).permit(:user_id, :course_id, :status)
  end
end
