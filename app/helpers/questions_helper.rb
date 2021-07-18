module QuestionsHelper
  def question_header(question)
    verb =  question.new_record? ? "Create" : "Update"
    "#{verb} test \"#{question.test.title}\" question"
  end
end
