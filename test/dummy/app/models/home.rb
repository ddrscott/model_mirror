class Home < ActiveRecord::Base
  belongs_to :country

  has_many :home_doors
  has_many :doors, through: :home_doors
  has_many :handles, through: :doors
end
