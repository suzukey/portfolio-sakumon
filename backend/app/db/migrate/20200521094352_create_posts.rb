class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :string do |t|
      t.references :user, type: :string, null: false, foreign_key: true

      t.string :title, null: false
      t.text :body

      t.integer :status, default: 1, null: false

      t.timestamps
    end
  end
end
