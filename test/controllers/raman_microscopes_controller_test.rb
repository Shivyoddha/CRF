require "test_helper"

class RamanMicroscopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raman_microscope = raman_microscopes(:one)
  end

  test "should get index" do
    get raman_microscopes_url
    assert_response :success
  end

  test "should get new" do
    get new_raman_microscope_url
    assert_response :success
  end

  test "should create raman_microscope" do
    assert_difference("RamanMicroscope.count") do
      post raman_microscopes_url, params: { raman_microscope: { Compatability: @raman_microscope.Compatability, carcinogenic: @raman_microscope.carcinogenic, description: @raman_microscope.description, measurement: @raman_microscope.measurement, more: @raman_microscope.more, sample: @raman_microscope.sample, stype: @raman_microscope.stype, toxicity: @raman_microscope.toxicity } }
    end

    assert_redirected_to raman_microscope_url(RamanMicroscope.last)
  end

  test "should show raman_microscope" do
    get raman_microscope_url(@raman_microscope)
    assert_response :success
  end

  test "should get edit" do
    get edit_raman_microscope_url(@raman_microscope)
    assert_response :success
  end

  test "should update raman_microscope" do
    patch raman_microscope_url(@raman_microscope), params: { raman_microscope: { Compatability: @raman_microscope.Compatability, carcinogenic: @raman_microscope.carcinogenic, description: @raman_microscope.description, measurement: @raman_microscope.measurement, more: @raman_microscope.more, sample: @raman_microscope.sample, stype: @raman_microscope.stype, toxicity: @raman_microscope.toxicity } }
    assert_redirected_to raman_microscope_url(@raman_microscope)
  end

  test "should destroy raman_microscope" do
    assert_difference("RamanMicroscope.count", -1) do
      delete raman_microscope_url(@raman_microscope)
    end

    assert_redirected_to raman_microscopes_url
  end
end
