class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false, limit:60
      t.integer :level, null: false, default: 1
      t.references :category, null: false, foreign_key_for: :category
      t.timestamps
    end
  end
end
