class ParticipationsController < ApplicationController
  before_filter :authenticate_user!

  def new
    invitation = Invitation.find(params[:invitation_id])
    @participation = Participation.new_from_invitation(params[:invitation_id])
  end

  def create
    @participation = Participation.new(participation_params)
    redirect_to user_path(participation_params[:user_id]) if @participation.save
  end

  private

  def participation_params
    @participation_params ||= params.require(:participation).permit([:collaboration_id, :user_id])
  end
end
