class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid, null: false
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :image, null: false
      t.string :description, null: false
      t.string :token, null: false
      t.string :secret, null: false

      t.timestamps null: false
    end

    add_index :users, :uid
  end
end
