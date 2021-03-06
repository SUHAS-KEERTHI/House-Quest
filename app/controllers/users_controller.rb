class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

 def create
   @user = User.new(user_params)
   if user.save
     flash[:success] = "User successfully added"
     redirect_to @user
   else
     render 'new'
     format.json { render json: @user.errors, status: :unprocessable_entity }
   end
 end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Details updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User successfully deleted"
    redirect_to users_url
  end
  #
  #def logged_in_user
  #  unless logged_in?
  #    flash[:danger] = "Please log in."
  #    redirect_to new_user_session_path
  #  end
  #end
  #    
  #def correct_user
  #  @user = User.find(params[:id])
  #  redirect_to(root_url) unless @user == current_user
  #end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :phone, :contact_type, :role_type, :company_id)
  end
    
  private
  
  # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end