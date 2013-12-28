class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.with_collaborations_and_invitations.find(params[:id])
  end

end
