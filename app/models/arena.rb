class Arena < ApplicationRecord
  belongs_to :fighter_1, class_name: :superbeing
  belongs_to :fighter_2, class_name: :superbeing

  scope :with_fighter, -> {|fighter| joins(:fighter_1).joins(:fighter_2).where('superbeing.id = ?', fighter.id) }

  def fighters
    [fighter_1, fighter_2]
  end
end
