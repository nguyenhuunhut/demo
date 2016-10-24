class ClassroomsController < ApplicationController


  def register
    @classroom = Classroom.find params[:id]
    register = @classroom.registers.where(user_id: current_user).first
    if @classroom.registers.where(is_register: true).count < @classroom.total
    if register
      register.update is_register: !register.is_register
    else
        register = Register.new classroom_id: params[:id], user_id: @current_user.id, is_register: true
        register.save
      end
      render json: {
        success: true,
        data: {
          registers: @classroom.registers.where(is_register: true).count,
          is_register: register.is_register
      }
    }
      else
        render json: {
          success: false,
        }


    end
  end

  def registered
    @registered = Register.where(user_id: @current_user, is_register: true)
  end
end
