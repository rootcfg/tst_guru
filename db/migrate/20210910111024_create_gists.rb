class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :user, null: false, foreign_key_for: :user
      t.string :url
      t.string :question, null: false, foreign_key_for: :question
      t.timestamps
    end
  end
end
