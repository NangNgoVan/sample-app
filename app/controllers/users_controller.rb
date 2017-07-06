class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :logged_in_user, except: [:new, :create, :show]
  before_action :admin_user, only: :destroy
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "check_you_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = t "user_deleted"
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmdation
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end

  def current_user? user
    user == current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
