class CreateAtendees < ActiveRecord::Migration
  def change
    create_table :atendees do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.integer :status, null: false

      t.timestamps null: false
    end

    add_index :atendees, :user_id
    add_index :atendees, :event_id
    add_index :atendees, :status
  end
end
