class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :player_name
      t.float :score

      t.timestamps
    end
  end
end
