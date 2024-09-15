class SessionsController < ApplicationController
  before_action :require_no_auth, only: [:new, :create]
  before_action :require_auth, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      sign_in(user)
      flash[:success] = "User Log in! Hi, #{user.decorate.name_or_email}!"
      redirect_to root_path
    else
      flash.now[:warning] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Good bye!"
    redirect_to root_path
  end
end
