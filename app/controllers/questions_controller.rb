class QuestionsController < ApplicationController

  before_action :find_test, only:  [:create, :index, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.build
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
    params.require(:question).permit(:body)
  end
end
