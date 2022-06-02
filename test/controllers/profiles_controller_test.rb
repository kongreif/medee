require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profiles_show_url
    assert_response :success
  end

  test "should get create" do
    get profiles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get profiles_destroy_url
    assert_response :success
  end
end
