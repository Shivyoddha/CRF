require "application_system_test_case"

class IonChromotographiesTest < ApplicationSystemTestCase
  setup do
    @ion_chromotography = ion_chromotographies(:one)
  end

  test "visiting the index" do
    visit ion_chromotographies_url
    assert_selector "h1", text: "Ion chromotographies"
  end

  test "should create ion chromotography" do
    visit ion_chromotographies_url
    click_on "New ion chromotography"

    fill_in "Analysis", with: @ion_chromotography.analysis
    fill_in "Column", with: @ion_chromotography.column
    fill_in "Concentration", with: @ion_chromotography.concentration
    fill_in "Detector", with: @ion_chromotography.detector
    fill_in "Disposal", with: @ion_chromotography.disposal
    fill_in "Elements", with: @ion_chromotography.elements
    fill_in "Eluent", with: @ion_chromotography.eluent
    fill_in "Flow rate", with: @ion_chromotography.flow_rate
    fill_in "Hazards", with: @ion_chromotography.hazards
    fill_in "More", with: @ion_chromotography.more
    fill_in "Nature", with: @ion_chromotography.nature
    fill_in "Sample", with: @ion_chromotography.sample
    fill_in "Solvent", with: @ion_chromotography.solvent
    fill_in "Temperature", with: @ion_chromotography.temperature
    fill_in "Toxicity", with: @ion_chromotography.toxicity
    fill_in "Volume", with: @ion_chromotography.volume
    click_on "Create Ion chromotography"

    assert_text "Ion chromotography was successfully created"
    click_on "Back"
  end

  test "should update Ion chromotography" do
    visit ion_chromotography_url(@ion_chromotography)
    click_on "Edit this ion chromotography", match: :first

    fill_in "Analysis", with: @ion_chromotography.analysis
    fill_in "Column", with: @ion_chromotography.column
    fill_in "Concentration", with: @ion_chromotography.concentration
    fill_in "Detector", with: @ion_chromotography.detector
    fill_in "Disposal", with: @ion_chromotography.disposal
    fill_in "Elements", with: @ion_chromotography.elements
    fill_in "Eluent", with: @ion_chromotography.eluent
    fill_in "Flow rate", with: @ion_chromotography.flow_rate
    fill_in "Hazards", with: @ion_chromotography.hazards
    fill_in "More", with: @ion_chromotography.more
    fill_in "Nature", with: @ion_chromotography.nature
    fill_in "Sample", with: @ion_chromotography.sample
    fill_in "Solvent", with: @ion_chromotography.solvent
    fill_in "Temperature", with: @ion_chromotography.temperature
    fill_in "Toxicity", with: @ion_chromotography.toxicity
    fill_in "Volume", with: @ion_chromotography.volume
    click_on "Update Ion chromotography"

    assert_text "Ion chromotography was successfully updated"
    click_on "Back"
  end

  test "should destroy Ion chromotography" do
    visit ion_chromotography_url(@ion_chromotography)
    click_on "Destroy this ion chromotography", match: :first

    assert_text "Ion chromotography was successfully destroyed"
  end
end
