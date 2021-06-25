class AddUserToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true, index: true
 end
end
