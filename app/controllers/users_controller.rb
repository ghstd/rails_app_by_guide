class UsersController < ApplicationController
  before_action :require_no_auth, only: [:new, :create]
  before_action :require_auth, only: [:edit, :update]
  before_action :set_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      remember(@user) if params[:remember_me] == "1"
      flash[:success] = "User created! Hi, #{@user.decorate.name_or_email}!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "User updated"
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :old_password)
  end

  def set_user!
    @user = User.find(params[:id])
  end
end
