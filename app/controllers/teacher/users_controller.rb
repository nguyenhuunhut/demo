class Teacher::UsersController < ApplicationController
  def pay
    @classroom = Classroom.find_by_id params[:classroom_id]
    pay = @classroom.registers.where(user_id: params[:id], is_register: true, is_pay: false).first
    pay.update is_pay: !pay.is_pay
    notication = Notication.new(id_from: @current_user.id, id_to: params[:id], content:
     "Giáo viên #{@current_user.name} vừa chấp nhận học phí của bạn ở lớp #{@classroom.name}")
    notication.save
    render json: {
      success: true,
      data: {
        is_pay: pay.is_pay
    }
  }
  end

  def remove
    @classroom = Classroom.find_by_id params[:classroom_id]
    remove = @classroom.registers.where(user_id: params[:id]).first
    remove.destroy
    notication = Notication.new(id_from: @current_user.id, id_to: params[:id], content:
     "Giáo viên #{@current_user.name} vừa cho bạn rời khỏi lớp #{@classroom.name}")
    notication.save
    render json: {
      success: true
  }
  end
end
