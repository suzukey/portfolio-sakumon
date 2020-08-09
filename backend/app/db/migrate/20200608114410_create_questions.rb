class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :string do |t|
      t.references :post, type: :string, null: false, foreign_key: true

      t.text :body, null: false

      t.integer :status, default: 1, null: false

      t.timestamps
    end
  end
end
