class Ship < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :board
  has_many :spaces
end
