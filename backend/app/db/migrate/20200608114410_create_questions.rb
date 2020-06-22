class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :string do |t|
      t.references :post, type: :string, null: false, foreign_key: true

      t.text :statement, null: false

      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
