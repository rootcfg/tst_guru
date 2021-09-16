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
    result = GistQuestionService.new(@test_passage.current_question, OktokitClient.new)
    flash_options = if result.call && result.success?
                      save_gist(@test_passage.current_question.body, @test_passage.user.email, result.client.oktokit.last_response.data.url)
                      { notice: t('.success', gist_url: result.client.oktokit.last_response.data.url) }
                    else
                      { alert: t('.alert') }
                    end
    redirect_to @test_passage, flash_options
  end

  private

  def save_gist(question, email, url)
    Gist.create(question: question.truncate(25), user: email, url: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end