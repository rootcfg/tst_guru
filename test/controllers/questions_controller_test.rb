require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get questions_all_url
    assert_response :success
  end

  test "should get show" do
    get questions_show_url
    assert_response :success
  end

end
