class Door < ActiveRecord::Base
  has_many :handles, as: :openable
  has_many :items, through: :handles, source: :openable, source_type: 'Door'
end
