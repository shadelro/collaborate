class ParticipationsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @participation = Participation.new
    if invitation = Invitation.find(params[:invitation_id], user_id: current_user.id)
      @participation.collaboration_id = invitation.collaboration_id
    end
  end

  def create
    @participation = Participation.new({user_id: current_user.id}.merge!(participation_params))
    redirect_to @participation.collaboration if @participation.save
  end

  def destroy
    Participation.destroy_all(id: params[:id], user_id: current_user.id)
    redirect_to current_user
  end

  private

  def participation_params
    @participation_params ||= params.require(:participation).permit(:collaboration_id)
  end
end
