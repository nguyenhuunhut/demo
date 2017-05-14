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
      @user= User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
         @user.assign_attributes user_params
       if @user.valid?
         @user.update(user_params)
         flash[:success] = "Update success!"
         redirect_to edit_user_path
      else
         render :edit
      end
    end

    def changepassword
      @user= User.find(params[:id])
      if Digest::MD5::hexdigest(params[:old_password]) == @user.password
        if params[:new_password] == params[:confirm_password]
          @user.update(password: Digest::MD5::hexdigest(params[:new_password]))
          flash[:success] = "Change password success!"
        end
      else
        flash[:error_change] = "Old password incorrectly!"
      end
      redirect_to edit_user_path

    end

    def user_params
      params.require(:user).permit(:email, :password, :name, :phone, :address, :role)
    end


end
