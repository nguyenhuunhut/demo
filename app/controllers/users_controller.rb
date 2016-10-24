class UsersController < ApplicationController

   skip_before_action :authenticate!

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      if  @user.save
        redirect_to login_path
      else
        render :new
      end
    end

    def edit
      @user = User.find_by id: params
    end


    def changepassword
      @user= User.find(params[:id])
      if Digest::MD5::hexdigest(params[:old_password]) == @user.password
        if params[:new_password] == params[:confirm_password]
          @user.update(password: params[:new_password])
          flash[:success] = "Đổi mật khẩu thành công!"
        end
      else
        flash[:error_change] = "Mật khẩu cũ không đúng!"
      end
      redirect_to edit_user_path
    end

    def user_params
      params.require(:user).permit(:email, :password, :name, :phone, :address, :role)
    end


end
