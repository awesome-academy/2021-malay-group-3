class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]

    unless @user
      flash[:danger] = "User not found"
      redirect_to home_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    # Handle a successful save.
     flash[:success] = "Do not forget to do course registration!"
     redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
