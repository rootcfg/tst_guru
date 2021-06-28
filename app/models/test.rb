class Test < ApplicationRecord
  belongs_to :category
  has_many :tests_user
  has_many :users, through: :tests_user

  private

  def self.test_by_category(category)
    joins(:category).where('categories.title = ? ', category).pluck(:title)
  end
end