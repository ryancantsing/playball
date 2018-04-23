class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.string :position
      
      t.timestamps
    end
  end
end
