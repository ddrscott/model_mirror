class HomeDoor < ActiveRecord::Base
  belongs_to :home
  belongs_to :door
end
