# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: [:destroy]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      do_sign_in(user)
    else
      flash.now[:warning] = 'Wrong email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Good bye!'
    redirect_to root_path
  end

  private

  def do_sign_in(user)
    sign_in(user)
    flash[:success] = "User Log in! Hi, #{user.decorate.name_or_email}!"
    redirect_to root_path
  end
end
