class Song < ActiveRecord::Base
  belongs_to :collaboration
  has_many :tracks

  attr_accessor :key, :tempo, :time_signature, :title

  def authors
    collaboration.users
  end
end
