class SessionsController < ApplicationController

  skip_before_action :authenticate!

  def new
     if @current_user
       user = User.find_by id: @current_user.id
       if user.is_admin
         redirect_to admin_users_path
       else
          if user.is_teacher
             redirect_to teacher_courses_path
          else
             redirect_to courses_path
          end
      end
    end

  end

  def create
    user = User.find_by email:params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]= "Login success!"
      if user.is_admin
        redirect_to admin_users_path
      else
         if user.is_teacher
            redirect_to teacher_courses_path
         else
            redirect_to courses_path
         end
     end

    else
      flash[:error]= "Email and password invalid"
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

end
