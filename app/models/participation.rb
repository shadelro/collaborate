class Participation < ActiveRecord::Base
  belongs_to :collaboration
  belongs_to :user

  after_save :delete_invitation

  private

  def delete_invitation
    Invitation.destroy_all(collaboration_id: self.collaboration_id, user_id: self.user_id)
  end
end
