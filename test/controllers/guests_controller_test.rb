require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get guests_form_url
    assert_response :success
  end

end
