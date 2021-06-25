class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  private

  def self.test_by_category(category)
    select(:title).where(category_id: category).order(title: :desc)
  end
end
