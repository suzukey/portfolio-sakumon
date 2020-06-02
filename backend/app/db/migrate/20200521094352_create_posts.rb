class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :string do |t|
      t.string :user_id, null: false

      t.string :title, null: false
      t.string :description

      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
