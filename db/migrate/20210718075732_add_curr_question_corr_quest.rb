class AddCurrQuestionCorrQuest < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests_users, :current_question, foreign_key: { to_table: :questions, primary_key: :id })
    add_column :tests_users, :correct_questions, :integer
  end
end
