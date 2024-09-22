# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_no_auth, only: %i[new create]
  before_action :require_auth, only: %i[edit update]
  before_action :set_user!, only: %i[edit update]
  before_action :authorize_question!
  after_action :verify_authorized

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      remember(@user) if params[:remember_me] == '1'
      flash[:success] = "User created! Hi, #{@user.decorate.name_or_email}!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated'
      redirect_to edit_user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :old_password)
  end

  def set_user!
    @user = User.find(params[:id])
  end

  def authorize_question!
    authorize(@question || Question)
  end
end
