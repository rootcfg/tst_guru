class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, null:false, limit: 80
      t.references :test, null: false, foreign_key_for: :test
      t.timestamps
    end
  end
end
