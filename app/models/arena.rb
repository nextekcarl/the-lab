class Arena < ApplicationRecord
  belongs_to :fighter_1, class_name: Superbeing
  belongs_to :fighter_2, class_name: Superbeing
  belongs_to :victor, class_name: Superbeing, optional: true

  scope :with_fighter, ->(fighter) { joins(:fighter_1).joins(:fighter_2).
    where('arenas.fighter_1_id = ? OR arenas.fighter_2_id = ?', fighter.id, fighter.id) }

  def fighters
    [fighter_1, fighter_2]
  end

  def set_up(fighter1 = Superbeing.new)
    self.fighter_1 = fighter1
    self.fighter_2 = Superbeing.new
    self.location = Location.random_arena
    self
  end
end
