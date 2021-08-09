class AddPrimaryKeyToTestsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :tests_users, :id, :primary_key
  end
end
