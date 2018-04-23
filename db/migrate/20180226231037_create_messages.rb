class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender
      t.references :recipient
      t.text :subject
      t.text :content
      t.boolean :read, default: false
      
      t.timestamps
    end
  end
end
