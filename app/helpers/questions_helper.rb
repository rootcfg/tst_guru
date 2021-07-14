module QuestionsHelper
  def question_header(question)
    "#{action_name.capitalize} test \"#{question.test.title}\" question"
  end
end
