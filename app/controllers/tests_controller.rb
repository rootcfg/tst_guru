class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %w[start]

  def index
    @pagy, @tests = pagy(Test.all, items: 10)
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

end