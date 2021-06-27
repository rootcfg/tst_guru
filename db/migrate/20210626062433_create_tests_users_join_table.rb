class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tests, :users, column_options: { null: false, foreign_key: true } do |t|
      t.index [:test_id, :user_id]
      t.index [:user_id, :test_id]
    end
  end
end
