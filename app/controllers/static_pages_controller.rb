class StaticPagesController < ApplicationController
  def home
    @course = current_user.courses.build if logged_in?
    @feed_items = current_user.feed.paginate page: params[:page]
  end

  def info; end
end
