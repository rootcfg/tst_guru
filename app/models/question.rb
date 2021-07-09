class Question < ApplicationRecord
  belongs_to :test
  has_many  :answers

  validates :body, presence: true, length: {maximum: 50, minimum: 10}
  validates :answers, presence: true

end
