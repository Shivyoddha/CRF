require "test_helper"

class TgaFttrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tga_fttr = tga_fttrs(:one)
  end

  test "should get index" do
    get tga_fttrs_url
    assert_response :success
  end

  test "should get new" do
    get new_tga_fttr_url
    assert_response :success
  end

  test "should create tga_fttr" do
    assert_difference("TgaFttr.count") do
      post tga_fttrs_url, params: { tga_fttr: { atmosphere: @tga_fttr.atmosphere, carcinogenic: @tga_fttr.carcinogenic, compatability: @tga_fttr.compatability, description: @tga_fttr.description, explosive: @tga_fttr.explosive, hazard: @tga_fttr.hazard, max_temp: @tga_fttr.max_temp, measurement: @tga_fttr.measurement, min_temp: @tga_fttr.min_temp, more: @tga_fttr.more, nature: @tga_fttr.nature, sample: @tga_fttr.sample, scan_rate: @tga_fttr.scan_rate, stype: @tga_fttr.stype } }
    end

    assert_redirected_to tga_fttr_url(TgaFttr.last)
  end

  test "should show tga_fttr" do
    get tga_fttr_url(@tga_fttr)
    assert_response :success
  end

  test "should get edit" do
    get edit_tga_fttr_url(@tga_fttr)
    assert_response :success
  end

  test "should update tga_fttr" do
    patch tga_fttr_url(@tga_fttr), params: { tga_fttr: { atmosphere: @tga_fttr.atmosphere, carcinogenic: @tga_fttr.carcinogenic, compatability: @tga_fttr.compatability, description: @tga_fttr.description, explosive: @tga_fttr.explosive, hazard: @tga_fttr.hazard, max_temp: @tga_fttr.max_temp, measurement: @tga_fttr.measurement, min_temp: @tga_fttr.min_temp, more: @tga_fttr.more, nature: @tga_fttr.nature, sample: @tga_fttr.sample, scan_rate: @tga_fttr.scan_rate, stype: @tga_fttr.stype } }
    assert_redirected_to tga_fttr_url(@tga_fttr)
  end

  test "should destroy tga_fttr" do
    assert_difference("TgaFttr.count", -1) do
      delete tga_fttr_url(@tga_fttr)
    end

    assert_redirected_to tga_fttrs_url
  end
end
