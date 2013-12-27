class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :collaboration

  validates_uniqueness_of :user_id, scope: [:collaboration_id]

  before_validation(on: :create) do
    !Collaboration.where(id: self.collaboration_id, user_id: self.user_id).any? &&
      !Participation.where(collaboration_id: self.collaboration_id, user_id: self.user_id).any?
  end

  def self.new_from_email(email, options = {})
    user = User.find_by_email(email)
    Invitation.new({user_id: user.id}.merge!(options))
  end
end
