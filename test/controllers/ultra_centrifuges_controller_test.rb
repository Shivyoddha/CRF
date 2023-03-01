require "test_helper"

class UltraCentrifugesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ultra_centrifuge = ultra_centrifuges(:one)
  end

  test "should get index" do
    get ultra_centrifuges_url
    assert_response :success
  end

  test "should get new" do
    get new_ultra_centrifuge_url
    assert_response :success
  end

  test "should create ultra_centrifuge" do
    assert_difference('UltraCentrifuge.count') do
      post ultra_centrifuges_url, params: { ultra_centrifuge: { carcinogenic: @ultra_centrifuge.carcinogenic, compatibility: @ultra_centrifuge.compatibility, debit: @ultra_centrifuge.debit, more: @ultra_centrifuge.more, sample: @ultra_centrifuge.sample, slotdate: @ultra_centrifuge.slotdate, slottime: @ultra_centrifuge.slottime, speed: @ultra_centrifuge.speed, status: @ultra_centrifuge.status, temperature: @ultra_centrifuge.temperature, toxicity: @ultra_centrifuge.toxicity, volume: @ultra_centrifuge.volume } }
    end

    assert_redirected_to ultra_centrifuge_url(UltraCentrifuge.last)
  end

  test "should show ultra_centrifuge" do
    get ultra_centrifuge_url(@ultra_centrifuge)
    assert_response :success
  end

  test "should get edit" do
    get edit_ultra_centrifuge_url(@ultra_centrifuge)
    assert_response :success
  end

  test "should update ultra_centrifuge" do
    patch ultra_centrifuge_url(@ultra_centrifuge), params: { ultra_centrifuge: { carcinogenic: @ultra_centrifuge.carcinogenic, compatibility: @ultra_centrifuge.compatibility, debit: @ultra_centrifuge.debit, more: @ultra_centrifuge.more, sample: @ultra_centrifuge.sample, slotdate: @ultra_centrifuge.slotdate, slottime: @ultra_centrifuge.slottime, speed: @ultra_centrifuge.speed, status: @ultra_centrifuge.status, temperature: @ultra_centrifuge.temperature, toxicity: @ultra_centrifuge.toxicity, volume: @ultra_centrifuge.volume } }
    assert_redirected_to ultra_centrifuge_url(@ultra_centrifuge)
  end

  test "should destroy ultra_centrifuge" do
    assert_difference('UltraCentrifuge.count', -1) do
      delete ultra_centrifuge_url(@ultra_centrifuge)
    end

    assert_redirected_to ultra_centrifuges_url
  end
end
