class Category < ApplicationRecord
  has_many :tests
  default_scope { all.order(title: :asc) }

  validates :title, presence: :true, length: { maximum: 30, minimum: 3}
end
