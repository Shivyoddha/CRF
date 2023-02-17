require "test_helper"

class AdvanceMolecularRheometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advance_molecular_rheometer = advance_molecular_rheometers(:one)
  end

  test "should get index" do
    get advance_molecular_rheometers_url
    assert_response :success
  end

  test "should get new" do
    get new_advance_molecular_rheometer_url
    assert_response :success
  end

  test "should create advance_molecular_rheometer" do
    assert_difference("AdvanceMolecularRheometer.count") do
      post advance_molecular_rheometers_url, params: { advance_molecular_rheometer: { analysis: @advance_molecular_rheometer.analysis, current: @advance_molecular_rheometer.current, more: @advance_molecular_rheometer.more, nature: @advance_molecular_rheometer.nature, sample: @advance_molecular_rheometer.sample, shear_rate: @advance_molecular_rheometer.shear_rate, shear_type: @advance_molecular_rheometer.shear_type, size: @advance_molecular_rheometer.size, sweeps: @advance_molecular_rheometer.sweeps, temperature: @advance_molecular_rheometer.temperature, toxicity: @advance_molecular_rheometer.toxicity, type: @advance_molecular_rheometer.type } }
    end

    assert_redirected_to advance_molecular_rheometer_url(AdvanceMolecularRheometer.last)
  end

  test "should show advance_molecular_rheometer" do
    get advance_molecular_rheometer_url(@advance_molecular_rheometer)
    assert_response :success
  end

  test "should get edit" do
    get edit_advance_molecular_rheometer_url(@advance_molecular_rheometer)
    assert_response :success
  end

  test "should update advance_molecular_rheometer" do
    patch advance_molecular_rheometer_url(@advance_molecular_rheometer), params: { advance_molecular_rheometer: { analysis: @advance_molecular_rheometer.analysis, current: @advance_molecular_rheometer.current, more: @advance_molecular_rheometer.more, nature: @advance_molecular_rheometer.nature, sample: @advance_molecular_rheometer.sample, shear_rate: @advance_molecular_rheometer.shear_rate, shear_type: @advance_molecular_rheometer.shear_type, size: @advance_molecular_rheometer.size, sweeps: @advance_molecular_rheometer.sweeps, temperature: @advance_molecular_rheometer.temperature, toxicity: @advance_molecular_rheometer.toxicity, type: @advance_molecular_rheometer.type } }
    assert_redirected_to advance_molecular_rheometer_url(@advance_molecular_rheometer)
  end

  test "should destroy advance_molecular_rheometer" do
    assert_difference("AdvanceMolecularRheometer.count", -1) do
      delete advance_molecular_rheometer_url(@advance_molecular_rheometer)
    end

    assert_redirected_to advance_molecular_rheometers_url
  end
end
