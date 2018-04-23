class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
