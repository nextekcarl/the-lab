class CreateSuperbeings < ActiveRecord::Migration[5.0]
  def change
    create_table :superbeings do |t|
      t.string :name
      t.string :origin
      t.text :description

      t.timestamps
    end
  end
end
