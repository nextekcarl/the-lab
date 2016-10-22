class AddVictorToArenas < ActiveRecord::Migration[5.0]
  def change
    add_column :arenas, :victor_id, :integer
    add_index :arenas, :victor_id
  end
end
