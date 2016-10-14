require 'test_helper'

class RandomPowersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get random_powers_index_url
    assert_response :success
  end

end
