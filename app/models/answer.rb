class Answer < ApplicationRecord

  MAX_ANSWERS = 4

  belongs_to :question
  scope :correct_answer, -> {where(correct: :true)}

  validates :body, presence: true
  validates :body, length: { maximum: 100 }
  validate :validate_count_in_one_question, if: :question, on: :create

  private

  def validate_count
    errors.add(:base, :maximum_answers_count) if question.answers.count >= MAX_ANSWERS
  end
end
