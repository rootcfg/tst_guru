class Question < ApplicationRecord
  belongs_to :test
  has_many  :answers

  validates :body, presence: true, length: {maximum: 50, minimum: 10}
  validates :answers, presence: true, if: :answers_count_permit?

  private

  def answers_count_permit?
    anwers.count > 1 && anwers.count <= 4 ? true : false
  end
end
