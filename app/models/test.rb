class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  private

  def self.test_by_category(category)
    select(:title).joins(:category).where('categories.title = ? ', category).pluck
  end
end