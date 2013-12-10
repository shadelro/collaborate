class Participation < ActiveRecord::Base
  belongs_to :collaboration
  belongs_to :user
end
