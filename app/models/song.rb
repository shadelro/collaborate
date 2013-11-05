class Song < ActiveRecord::Base
  belongs_to :collaboration

  has_many :tracks
end
