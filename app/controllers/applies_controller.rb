class AppliesController < ApplicationController
   before_action :logged_in_user

  def new
    @apply = Apply.new
  end

  def create
    @user = User.find_by(id: params[:id])
    @course = Course.find_by(params[:id])
    @apply = Apply.new(apply_params)

    if @apply.save
      flash[:info] = "Registeration Pending"
      redirect_back(fallback_location: @user)
    else
      flash[:danger] = "Registeration Denied!"
      redirect_back(fallback_location: @user)
    end
  end

  def edit
    @apply = Apply.find(params[:id])
  end

  def update
    @course = Course.find_by(params[:id])
    @apply = Apply.find(params[:id])

    if @register.update(register_params)
      flash[:success] = "Updated!"
      redirect_to @register.course
    else
      flash[:danger] = "Error 404!"
      render :edit
    end
  end

  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy
    flash[:success] = "Registeration Deleted!"
    redirect_back(fallback_location: @user)
  end

  private

  def apply_params
    params.require(:apply).permit(:user_id, :course_id, :status)
  end
end
