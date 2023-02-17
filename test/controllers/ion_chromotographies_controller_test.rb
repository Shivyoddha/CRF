require "test_helper"

class IonChromotographiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ion_chromotography = ion_chromotographies(:one)
  end

  test "should get index" do
    get ion_chromotographies_url
    assert_response :success
  end

  test "should get new" do
    get new_ion_chromotography_url
    assert_response :success
  end

  test "should create ion_chromotography" do
    assert_difference("IonChromotography.count") do
      post ion_chromotographies_url, params: { ion_chromotography: { analysis: @ion_chromotography.analysis, column: @ion_chromotography.column, concentration: @ion_chromotography.concentration, detector: @ion_chromotography.detector, disposal: @ion_chromotography.disposal, elements: @ion_chromotography.elements, eluent: @ion_chromotography.eluent, flow_rate: @ion_chromotography.flow_rate, hazards: @ion_chromotography.hazards, more: @ion_chromotography.more, nature: @ion_chromotography.nature, sample: @ion_chromotography.sample, solvent: @ion_chromotography.solvent, temperature: @ion_chromotography.temperature, toxicity: @ion_chromotography.toxicity, volume: @ion_chromotography.volume } }
    end

    assert_redirected_to ion_chromotography_url(IonChromotography.last)
  end

  test "should show ion_chromotography" do
    get ion_chromotography_url(@ion_chromotography)
    assert_response :success
  end

  test "should get edit" do
    get edit_ion_chromotography_url(@ion_chromotography)
    assert_response :success
  end

  test "should update ion_chromotography" do
    patch ion_chromotography_url(@ion_chromotography), params: { ion_chromotography: { analysis: @ion_chromotography.analysis, column: @ion_chromotography.column, concentration: @ion_chromotography.concentration, detector: @ion_chromotography.detector, disposal: @ion_chromotography.disposal, elements: @ion_chromotography.elements, eluent: @ion_chromotography.eluent, flow_rate: @ion_chromotography.flow_rate, hazards: @ion_chromotography.hazards, more: @ion_chromotography.more, nature: @ion_chromotography.nature, sample: @ion_chromotography.sample, solvent: @ion_chromotography.solvent, temperature: @ion_chromotography.temperature, toxicity: @ion_chromotography.toxicity, volume: @ion_chromotography.volume } }
    assert_redirected_to ion_chromotography_url(@ion_chromotography)
  end

  test "should destroy ion_chromotography" do
    assert_difference("IonChromotography.count", -1) do
      delete ion_chromotography_url(@ion_chromotography)
    end

    assert_redirected_to ion_chromotographies_url
  end
end
