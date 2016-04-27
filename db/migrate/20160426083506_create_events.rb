class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.datetime :hold_at, null: false
      t.integer :capacity, null: false
      t.string :location, null: false
      t.string :owner, null: false
      t.text :description, null: false

      t.timestamps null: false
    end

    add_index :events, :user_id
  end
end
