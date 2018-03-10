class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :home, index: true, foreign_key: true
      t.references :away, index: true, foreign_key: true
      t.datetime :date
      t.text :details

      t.timestamps null: false
    end
  end
end
