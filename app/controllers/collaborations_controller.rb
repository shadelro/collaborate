class CollaborationsController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def show
    @collaboration = Collaboration.find(params[:id])
  end

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    if @collaboration.save
      @participation = Participation.new(user_id: current_user.id, collaboration_id: @collaboration.id)
      if @participation.save
        redirect_to user_collaboration_path(collaboration_params[:user_id], @collaboration.id)
      else
        @collaboration.delete
      end
    end
  end

  private

  def collaboration_params
    @collaboration_params ||= params.require(:collaboration).permit(:name).merge!(params.permit(:user_id))
  end

end
