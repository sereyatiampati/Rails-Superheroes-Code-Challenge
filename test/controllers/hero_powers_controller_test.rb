require "test_helper"

class HeroPowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hero_power = hero_powers(:one)
  end

  test "should get index" do
    get hero_powers_url, as: :json
    assert_response :success
  end

  test "should create hero_power" do
    assert_difference("HeroPower.count") do
      post hero_powers_url, params: { hero_power: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show hero_power" do
    get hero_power_url(@hero_power), as: :json
    assert_response :success
  end

  test "should update hero_power" do
    patch hero_power_url(@hero_power), params: { hero_power: {  } }, as: :json
    assert_response :success
  end

  test "should destroy hero_power" do
    assert_difference("HeroPower.count", -1) do
      delete hero_power_url(@hero_power), as: :json
    end

    assert_response :no_content
  end
end
