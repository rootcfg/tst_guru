class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  has_many :bages_users, dependent: :destroy
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_next_question, on: :update, if: ->  { !completed? }

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    if completed? && success?
      self.success_test = true
    end
    save
  end

  def completed?
    current_question.nil?
  end

  def success?
    result > SUCCESS_PERCENT
  end

  def result
    correct_questions * 100 / test.questions.count
  end

  def number_of_questions
    test.questions.order(id: :asc).where('id < ?', current_question_id).count + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_next_question
    self.current_question =  test.questions.order(:id).where('id > ?', current_question_id).first

  end

  def correct_answer?(answers_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answers_ids).count) &&
      correct_answers_count == answers_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

end