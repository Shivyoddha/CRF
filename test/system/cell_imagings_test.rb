require "application_system_test_case"

class CellImagingsTest < ApplicationSystemTestCase
  setup do
    @cell_imaging = cell_imagings(:one)
  end

  test "visiting the index" do
    visit cell_imagings_url
    assert_selector "h1", text: "Cell imagings"
  end

  test "should create cell imaging" do
    visit cell_imagings_url
    click_on "New cell imaging"

    fill_in "Assay type", with: @cell_imaging.assay_type
    fill_in "Compatibility", with: @cell_imaging.compatibility
    fill_in "Detection", with: @cell_imaging.detection
    fill_in "Expected wavelenght", with: @cell_imaging.expected_wavelenght
    fill_in "Hazard", with: @cell_imaging.hazard
    fill_in "Image filter", with: @cell_imaging.image_filter
    fill_in "Image mode", with: @cell_imaging.image_mode
    fill_in "More", with: @cell_imaging.more
    fill_in "Plate", with: @cell_imaging.plate
    fill_in "Sample", with: @cell_imaging.sample
    fill_in "Stype", with: @cell_imaging.stype
    fill_in "Toxicity", with: @cell_imaging.toxicity
    click_on "Create Cell imaging"

    assert_text "Cell imaging was successfully created"
    click_on "Back"
  end

  test "should update Cell imaging" do
    visit cell_imaging_url(@cell_imaging)
    click_on "Edit this cell imaging", match: :first

    fill_in "Assay type", with: @cell_imaging.assay_type
    fill_in "Compatibility", with: @cell_imaging.compatibility
    fill_in "Detection", with: @cell_imaging.detection
    fill_in "Expected wavelenght", with: @cell_imaging.expected_wavelenght
    fill_in "Hazard", with: @cell_imaging.hazard
    fill_in "Image filter", with: @cell_imaging.image_filter
    fill_in "Image mode", with: @cell_imaging.image_mode
    fill_in "More", with: @cell_imaging.more
    fill_in "Plate", with: @cell_imaging.plate
    fill_in "Sample", with: @cell_imaging.sample
    fill_in "Stype", with: @cell_imaging.stype
    fill_in "Toxicity", with: @cell_imaging.toxicity
    click_on "Update Cell imaging"

    assert_text "Cell imaging was successfully updated"
    click_on "Back"
  end

  test "should destroy Cell imaging" do
    visit cell_imaging_url(@cell_imaging)
    click_on "Destroy this cell imaging", match: :first

    assert_text "Cell imaging was successfully destroyed"
  end
end
