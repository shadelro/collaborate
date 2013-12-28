class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new(collaboration_id: params[:collaboration_id])
  end

  def create
    user = User.find_by_email(params[:email])
    @invitation = Invitation.new(user_id: user.id, collaboration_id: invitation_params[:collaboration_id])
    redirect_to @invitation.collaboration if @invitation.save
  end

  def destroy
    Invitation.destroy_all(id: params[:id], user_id: current_user.id)
    redirect_to current_user
  end

  private

  def invitation_params
    @invitation_params ||= params.require(:invitation).permit(:collaboration_id, :user_id)
  end
end
