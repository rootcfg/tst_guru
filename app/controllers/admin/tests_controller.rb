class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %w[index update_inline]
  before_action :set_test, only: %w[show edit update destroy start update_inline]

  def index
  end

  def new
    @test = current_user.authored_tests.build
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def create
    @test = current_user.authored_tests.build(test_params)
    if @test.save
      redirect_to admin_tests_path, success: t('.success')
    else
      redirect_to new_admin_test_path, error: t('.error')
    end
  end

  def edit;end

  def show;end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @pagy, @tests = pagy(Test.all, items: 10)
  end

end