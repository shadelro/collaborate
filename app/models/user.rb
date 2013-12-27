class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborations, dependent: :destroy
  has_many :collaborations_as_participant, through: :participations, source: :collaboration
  has_many :participations, dependent: :destroy
  has_many :collaborations_as_invited, through: :invitations, source: :collaboration
  has_many :invitations, dependent: :destroy

  validates_uniqueness_of :email

  def all_collaborations
    self.collaborations | self.collaborations_as_participant
  end
end
