class QuestionsController < ApplicationController

  before_action :question_params, only: [:create]
  before_action :find_test, only:  [:create]

  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to tests_path
    else
      render plain: "#{ @question.errors.messages}"
    end
  end

  private

  def find_test
    @test = Test.find_by(id: params[:test_id])
  end

  def show_errors
    render root_path, status: 404
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
