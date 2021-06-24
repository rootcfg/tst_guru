class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.references :question, index: { name: 'index_answer_on_question_id' }
      t.timestamps
    end
  end
end