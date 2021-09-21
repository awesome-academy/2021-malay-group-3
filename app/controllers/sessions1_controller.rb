class Sessions1Controller < ApplicationController
  def new
  end

  def create
    course = Course.find_by(course: params[:session1][:name])
    if course && course.authenticate(params[:session1][:password])
      confirm_registration course
      redirect_to course
    # Log the user in and redirect to the user's show page.
    else
    # Create an error message.
      flash.now[:danger] = 'Invalid course/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
