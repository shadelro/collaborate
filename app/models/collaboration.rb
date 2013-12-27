class Collaboration < ActiveRecord::Base
  belongs_to :user
  has_many :songs, dependent: :destroy
  has_many :participants, through: :participations, source: :user
  has_many :participations, dependent: :destroy
end
