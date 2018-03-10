class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
