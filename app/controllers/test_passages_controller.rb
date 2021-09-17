class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answers_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, nil)
    flash_options = if result.call && result.success?
                      save_gist(@test_passage.current_question.id, @test_passage.user.id, result.client.last_response.data.url)
                      { notice: t('.success', gist_url: result.client.last_response.data.url) }
                    else
                      { alert: t('.alert') }
                    end
    redirect_to @test_passage, flash_options
  end

  private

  def save_gist(question, user, url)
    Gist.create(question_id: question, user_id: user, url: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end