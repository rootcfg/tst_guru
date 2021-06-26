class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tests, :users do |t|
      t.references :tests, foreign_key: true
      t.references :users, foreign_key: true
    end
  end
end
