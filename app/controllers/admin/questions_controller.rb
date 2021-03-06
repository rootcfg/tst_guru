class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only:  [:create, :index, :new, :update]
  before_action :set_question ,only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def index
    @questions = @test.questions
  end

  def show;end

  def edit;end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_questions_path
    else
      render plain: "#{ @question.errors.messages}"
    end
  end

  def update
      if @question.update(question_params)
         redirect_to admin_question_path(@question), success: t('admin.questions.update.success')
      else
         render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @question.delete ?  flash[:negative] = "Das gut" : flash[:negative] = "Ooops..."
    redirect_to tests_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

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
