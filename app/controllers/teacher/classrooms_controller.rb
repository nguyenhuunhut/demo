class Teacher::ClassroomsController < ApplicationController

  def new
    @classroom = Classroom.new
  end

  def create
     @course = Course.find(params[:course_id])
    if classroom = @course.classrooms().create(classroom_params.merge(user_id: current_user.id))
      flash[:success] = "Thêm mới thành công!"
      redirect_to teacher_course_path(@course.id)
    end
   end

  def edit
    @classroom = Classroom.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @classroom = Classroom.find(params[:id])
    if @classroom.update classroom_params
      flash[:success] = "Chỉnh sửa thành công!"
      redirect_to teacher_course_path(@course.id)
    else
      render :edit
    end
  end

  def destroy
    @classroom = Classroom.find params[:id]
    if @classroom.destroy
      render json: {success: true}
    end
  end

  def show
    @classroom = Classroom.find params[:id]

  end



  def classroom_params
    params.require(:classroom).permit(:name, :subject, :total, :month, :schedule, :start, :fee, :course_id)
  end


end
