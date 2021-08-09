class AddPassedToTestPasssage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :passed, :boolean, default: 0
  end
end
