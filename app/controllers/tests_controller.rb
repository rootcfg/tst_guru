class TestsController < ApplicationController

  before_action :set_test, only: %w[show edit update destroy start]

  def index
    @pagy, @tests = pagy(Test.all, items: 10)
  end

  def new
    @test = Test.new
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      render plain: "#{@test.errors}"
    end
  end

  def edit;end

  def show;end

  private

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

end