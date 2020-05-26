class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :public_id, null: false
      t.integer :user_id, null: false

      t.string :title, null: false
      t.string :description

      t.integer :status, null: false

      t.timestamps
    end

    add_index :posts, :public_id, unique: true
  end
end
