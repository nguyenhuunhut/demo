class Admin::UsersController < Admin::BaseController

  skip_before_action :authenticate!


    def index
      @users = User.paginate(page: params[:page])
    end

   def new
     @user = User.new
   end

   def create
     @user = User.new user_params
     if  @user.save
       flash[:success] = "Add success!"
       redirect_to admin_users_path
     else
       render :new
     end
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
        @user.assign_attributes user_params
      if @user.valid?
        @user.update(user_params)
        flash[:success] = "Edit success!"
        redirect_to admin_users_path
     else
        render :edit
     end
   end

   def destroy
     @user = User.find(params[:id])
    if
     @user.destroy
     render json: {success: true}
   end
   end

   def show
     @user = User.find params[:id]
   end

   private
   def user_params
     params.require(:user).permit(:email, :password, :name, :phone, :address, :role)
   end



end
