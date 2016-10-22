class CreateArenas < ActiveRecord::Migration[5.0]
  def change
    create_table :arenas do |t|
      t.string :location
      t.text :description
      t.integer :fighter_1_id
      t.integer :fighter_2_id

      t.timestamps
    end
    add_index :arenas, :fighter_1_id
    add_index :arenas, :fighter_2_id
  end
end
