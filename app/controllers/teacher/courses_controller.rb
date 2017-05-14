class Teacher::CoursesController < ApplicationController
  def index
        @courses = @current_user.courses
        @notications = Notication.where(id_to: @current_user, status: true)
  end

  def show
    @course = Course.find params[:id]
  end

  def new
    @course = Course.new
  end

  def create
      @course = @current_user.courses.create(course_params)
      if @course.save
      flash[:success] ="Add success! "
      redirect_to teacher_courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update course_params
      flash[:success] = "Add success!"
      redirect_to teacher_courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      render json: {success: true}
    end
  end

  def course_params
    params.require(:course).permit(:name, :description, :user_id)
  end
end
