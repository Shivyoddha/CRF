require "test_helper"

class CellImagingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cell_imaging = cell_imagings(:one)
  end

  test "should get index" do
    get cell_imagings_url
    assert_response :success
  end

  test "should get new" do
    get new_cell_imaging_url
    assert_response :success
  end

  test "should create cell_imaging" do
    assert_difference("CellImaging.count") do
      post cell_imagings_url, params: { cell_imaging: { assay_type: @cell_imaging.assay_type, compatibility: @cell_imaging.compatibility, detection: @cell_imaging.detection, expected_wavelenght: @cell_imaging.expected_wavelenght, hazard: @cell_imaging.hazard, image_filter: @cell_imaging.image_filter, image_mode: @cell_imaging.image_mode, more: @cell_imaging.more, plate: @cell_imaging.plate, sample: @cell_imaging.sample, stype: @cell_imaging.stype, toxicity: @cell_imaging.toxicity } }
    end

    assert_redirected_to cell_imaging_url(CellImaging.last)
  end

  test "should show cell_imaging" do
    get cell_imaging_url(@cell_imaging)
    assert_response :success
  end

  test "should get edit" do
    get edit_cell_imaging_url(@cell_imaging)
    assert_response :success
  end

  test "should update cell_imaging" do
    patch cell_imaging_url(@cell_imaging), params: { cell_imaging: { assay_type: @cell_imaging.assay_type, compatibility: @cell_imaging.compatibility, detection: @cell_imaging.detection, expected_wavelenght: @cell_imaging.expected_wavelenght, hazard: @cell_imaging.hazard, image_filter: @cell_imaging.image_filter, image_mode: @cell_imaging.image_mode, more: @cell_imaging.more, plate: @cell_imaging.plate, sample: @cell_imaging.sample, stype: @cell_imaging.stype, toxicity: @cell_imaging.toxicity } }
    assert_redirected_to cell_imaging_url(@cell_imaging)
  end

  test "should destroy cell_imaging" do
    assert_difference("CellImaging.count", -1) do
      delete cell_imaging_url(@cell_imaging)
    end

    assert_redirected_to cell_imagings_url
  end
end
