class Collaboration < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :participations
  has_many :participations
  has_many :songs
end
