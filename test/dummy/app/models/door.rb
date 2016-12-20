class Door < ActiveRecord::Base
  has_many :handles, as: :openable
  has_many :items, through: :handles
end
