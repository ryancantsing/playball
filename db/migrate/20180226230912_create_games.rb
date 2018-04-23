class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :home
      t.references :away
      t.datetime :date
      t.boolean :away_confirm, default: false
      t.boolean :home_confirm, default: false
      t.text :details
      t.timestamps null: false
    end
  end
end
