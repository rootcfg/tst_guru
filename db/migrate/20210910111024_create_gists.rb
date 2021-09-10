class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :user
      t.string :url
      t.string :question
      t.timestamps
    end
  end
end
