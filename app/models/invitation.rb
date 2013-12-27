class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :collaboration

  validates_uniqueness_of :user_id, scope: [:collaboration_id]

  before_validation(on: :create) do
    !User.find(self.user_id).all_collaborations.map(&:id).include?(self.collaboration_id)
  end

  def self.new_from_email(email, options = {})
    user = User.find_by_email(email)
    Invitation.new({user_id: user.id}.merge!(options))
  end
end
