class Participation < ActiveRecord::Base
  belongs_to :collaboration
  belongs_to :user

  after_save :destroy_invitations

  before_validation(on: :create) do
    Invitation.where(collaboration_id: self.collaboration_id, user_id: self.user_id).present?
  end

  private

  def destroy_invitations
    Invitation.destroy_all(collaboration_id: self.collaboration_id, user_id: self.user_id)
  end
end
