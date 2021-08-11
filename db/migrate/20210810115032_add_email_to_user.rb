class AddEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, :limit => 40
  end
end
