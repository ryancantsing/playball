class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :coach, index: true, foreign_key: true
      t.string :name
      t.string :sport
      t.timestamps null: false
    end
  end
end
