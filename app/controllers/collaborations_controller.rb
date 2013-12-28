class CollaborationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @collaborations = Collaboration.all
  end

  def show
    @collaboration = Collaboration.find(params[:id])
  end

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new({user_id: current_user.id}.merge!(collaboration_params))
    redirect_to @collaboration if @collaboration.save
  end

  def destroy
    Collaboration.destroy_all(id: params[:id], user_id: current_user.id)
    redirect_to current_user
  end

  private

  def collaboration_params
    @collaboration_params ||= params.require(:collaboration).permit(:name)
  end

end
