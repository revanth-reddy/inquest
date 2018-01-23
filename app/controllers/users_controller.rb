class UsersController < ApplicationController
	 before_action :logged_in_user, only: [:edit, :update, :destroy,:show]
   before_action :correct_user,   only: [:show, :edit, :update]
   before_action :admin_user,     only: [:destroy, :edit_level]

  def index
  	@users = User.order('score DESC, last_correct_answer_at ASC, updated_at ASC').paginate(:page => params[:page], :per_page => 50)
    @page  = (params[:page].to_i) -1 if params[:page]
  end

  def edit_level
    @level = Level.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # if verify_recaptcha(model: @user) && @user.save
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :name, :email, :password,
                                   :password_confirmation, :college, :Contact_number)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
