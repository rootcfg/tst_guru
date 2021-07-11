class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      render plain: "#{@test.errors}"
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end