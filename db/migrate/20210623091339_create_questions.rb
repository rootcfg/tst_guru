class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, null:false, limit: 80
      t.references :test, null: false, index: { name: 'index_question_on_test_id' }
      t.timestamps
    end
  end
end
