class Handle < ActiveRecord::Base
  belongs_to :openable, polymorphic: true
end
