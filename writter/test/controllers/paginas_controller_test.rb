require "test_helper"

class PaginasControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get paginas_home_url
    assert_response :success
  end

  test "should get about" do
    get paginas_about_url
    assert_response :success
  end

  test "should get contact" do
    get paginas_contact_url
    assert_response :success
  end
end
