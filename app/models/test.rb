class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional: true
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1)}
  scope :middle, -> { where(level: 2..4)}
  scope :hard, -> { where(level: 5..Float::INFINITY)}
  scope :by_category, ->(category) { joins(:category).where('categories.title = ? ', category)
                                                           .order(level: :desc)
                                                           .pluck(:title)}

  validates :title,:category_id,:author_id, presence: true
  validates :title, length: { in: 3..50 }
  validates :level, numericality: { only_integer: true, less_than_or_equal_to: 4 }
  validates :title, uniqueness: { scope: :level,
                                  message: "should happen once level" }

end