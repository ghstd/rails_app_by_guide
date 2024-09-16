class Admin::UsersController < ApplicationController
  before_action :require_auth

  def index
    @pagy, @users = pagy(User.order(created_at: :desc), limit: 10)
  end
end
