class Collaboration < ActiveRecord::Base
  belongs_to :user
  has_many :songs, dependent: :destroy
  has_many :participants, through: :participations, source: :user
  has_many :participations, dependent: :destroy
  has_many :invitations, dependent: :destroy

  validates_uniqueness_of :name

  scope :with_users, -> {
    includes(:user).includes(:participants)
  }
end
