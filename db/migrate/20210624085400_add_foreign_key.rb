class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tests, :categories
    add_foreign_key :questions, :tests
    add_foreign_key :answers, :questions
    add_column :answers, :correct, :boolean
  end
end
