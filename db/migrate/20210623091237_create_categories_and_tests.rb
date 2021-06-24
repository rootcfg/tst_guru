class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null:false, limit: 30
      t.timestamps
    end
    create_table :tests do |t|
      t.string :title, null: false, limit:60
      t.integer :level, null: false, default: 1
      t.references :category, null: false, index: { name: 'index_test_on_category_id'}
      t.timestamps
    end
  end
end
