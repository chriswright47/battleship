class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :boards
  has_many :ships, through: :boards
end
