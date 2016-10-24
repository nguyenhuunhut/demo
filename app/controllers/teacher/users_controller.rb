class Teacher::UsersController < ApplicationController
  def pay
    @classroom = Classroom.find_by_id params[:classroom_id]
    pay = @classroom.registers.where(user_id: params[:id], is_register: true, is_pay: false).first
    pay.update is_pay: !pay.is_pay
    render json: {
      success: true,
      data: {
        is_pay: pay.is_pay
    }
  }
  end
end
