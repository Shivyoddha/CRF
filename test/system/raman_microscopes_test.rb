require "application_system_test_case"

class RamanMicroscopesTest < ApplicationSystemTestCase
  setup do
    @raman_microscope = raman_microscopes(:one)
  end

  test "visiting the index" do
    visit raman_microscopes_url
    assert_selector "h1", text: "Raman microscopes"
  end

  test "should create raman microscope" do
    visit raman_microscopes_url
    click_on "New raman microscope"

    fill_in "Compatability", with: @raman_microscope.Compatability
    fill_in "Carcinogenic", with: @raman_microscope.carcinogenic
    fill_in "Description", with: @raman_microscope.description
    fill_in "Measurement", with: @raman_microscope.measurement
    fill_in "More", with: @raman_microscope.more
    fill_in "Sample", with: @raman_microscope.sample
    fill_in "Stype", with: @raman_microscope.stype
    fill_in "Toxicity", with: @raman_microscope.toxicity
    click_on "Create Raman microscope"

    assert_text "Raman microscope was successfully created"
    click_on "Back"
  end

  test "should update Raman microscope" do
    visit raman_microscope_url(@raman_microscope)
    click_on "Edit this raman microscope", match: :first

    fill_in "Compatability", with: @raman_microscope.Compatability
    fill_in "Carcinogenic", with: @raman_microscope.carcinogenic
    fill_in "Description", with: @raman_microscope.description
    fill_in "Measurement", with: @raman_microscope.measurement
    fill_in "More", with: @raman_microscope.more
    fill_in "Sample", with: @raman_microscope.sample
    fill_in "Stype", with: @raman_microscope.stype
    fill_in "Toxicity", with: @raman_microscope.toxicity
    click_on "Update Raman microscope"

    assert_text "Raman microscope was successfully updated"
    click_on "Back"
  end

  test "should destroy Raman microscope" do
    visit raman_microscope_url(@raman_microscope)
    click_on "Destroy this raman microscope", match: :first

    assert_text "Raman microscope was successfully destroyed"
  end
end
