class Question < ApplicationRecord
  belongs_to :test
  has_many  :answers

  validates :body, presence: true, length: {maximum: 150, minimum: 10}

  def number
    test.questions.order(:id).ids.index(id) + 1
  end

end
