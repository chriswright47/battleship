class Space < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :board
  belongs_to :ship
end
