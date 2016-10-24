class Admin::DashboardController < Admin::BaseController
  
  def teachers
    @teachers = User.where(role: 1).paginate(page: params[:page])
  end

  def students
    @students = User.where(role: 0).paginate(page: params[:page])
  end
end
