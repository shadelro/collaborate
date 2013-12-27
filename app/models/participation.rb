class Participation < ActiveRecord::Base
  belongs_to :collaboration
  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:collaboration_id]

  after_save :destroy_invitations

  before_validation(on: :create) do
    Invitation.where(collaboration_id: self.collaboration_id, user_id: self.user_id).any?
  end

  def self.new_from_invitation(invitation_id)
    invitation = Invitation.find(invitation_id)
    Participation.new(collaboration_id: invitation.collaboration_id, user_id: invitation.user_id)
  end

  private

  def destroy_invitations
    Invitation.destroy_all(collaboration_id: self.collaboration_id, user_id: self.user_id)
  end
end
