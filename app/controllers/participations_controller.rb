class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new(
      user_id: params[:user_id],
      collaboration_id: params[:collaboration_id]
    )
  end

  def create
    @participation = Participation.new(participation_params)
    if @participation.save
      binding.pry
      redirect_to user_collaboration_path(
        participation_params[:user_id],
        participation_params[:collaboration_id]
      )
    end
  end

  private

  def participation_params
    params.require(:participation).permit([:user_id, :collaboration_id])
  end
end
