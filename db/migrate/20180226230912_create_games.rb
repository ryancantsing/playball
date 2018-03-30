class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :home, index: true, foreign_key: true
      t.references :away, index: true, foreign_key: true
      t.datetime :date
      t.boolean :away_confirm, default: false
      t.boolean :home_confirm, default: false
      t.text :details
      t.timestamps null: false
    end
  end
end
