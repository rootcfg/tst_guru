require 'test_helper'

class FeedbakControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedbak_index_url
    assert_response :success
  end

  test "should get create" do
    get feedbak_create_url
    assert_response :success
  end

end
