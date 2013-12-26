class ParticipationsController < ApplicationController
  before_filter :authenticate_user!

  def new
    invitation = Invitation.find(params[:invitation_id])
    @participation = Participation.new(collaboration_id: invitation.collaboration_id, user_id: invitation.user_id)
  end

  def create
    @participation = Participation.new({user_id: current_user.id}.merge!(participation_params))
    redirect_to user_path(current_user) if @participation.save
  end

  private

  def participation_params
    @participation_params ||= params.require(:participation).permit([:collaboration_id, :user_id])
  end
end
