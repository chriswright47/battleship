class Board < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  has_many :ships
  has_many :spaces
end
