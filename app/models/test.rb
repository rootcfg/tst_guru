class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional: true
  has_many :tests_user
  has_many :users, through: :tests_user

  private

  def self.test_by_category(category)
    joins(:category).where('categories.title = ? ', category).order(level: :desc).pluck(:title)
  end
end