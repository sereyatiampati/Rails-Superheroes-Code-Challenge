require "test_helper"

class PowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @power = powers(:one)
  end

  test "should get index" do
    get powers_url, as: :json
    assert_response :success
  end

  test "should create power" do
    assert_difference("Power.count") do
      post powers_url, params: { power: { description: @power.description, name: @power.name } }, as: :json
    end

    assert_response :created
  end

  test "should show power" do
    get power_url(@power), as: :json
    assert_response :success
  end

  test "should update power" do
    patch power_url(@power), params: { power: { description: @power.description, name: @power.name } }, as: :json
    assert_response :success
  end

  test "should destroy power" do
    assert_difference("Power.count", -1) do
      delete power_url(@power), as: :json
    end

    assert_response :no_content
  end
end
