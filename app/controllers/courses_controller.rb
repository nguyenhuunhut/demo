class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @notication = Notication.where(id_to: @current_user, status: true)
  end

  def show
    @course = Course.find params[:id]
  end
end
