class Track < ActiveRecord::Base
  belongs_to :song

  attr_accessor :author, :instrument, :title
end
