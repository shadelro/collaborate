class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @invitation = Invitation.find(invitation_params[:id])
  end

  def destroy
    Invitation.destroy_all(id: invitation_params[:id], user_id: current_user.id)
    redirect_to user_path(current_user)
  end

  private

  def invitation_params
    @invitation_params ||= params.permit(:id)
  end
end
