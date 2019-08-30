class Move < ApplicationRecord

  validates :player_name, presence: true
  validates :score, presence: true

end
