class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices, id: :string do |t|
      t.references :question, type: :string, null: false, foreign_key: true

      t.string :body, null: false
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
