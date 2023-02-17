require "application_system_test_case"

class AdvanceMolecularRheometersTest < ApplicationSystemTestCase
  setup do
    @advance_molecular_rheometer = advance_molecular_rheometers(:one)
  end

  test "visiting the index" do
    visit advance_molecular_rheometers_url
    assert_selector "h1", text: "Advance molecular rheometers"
  end

  test "should create advance molecular rheometer" do
    visit advance_molecular_rheometers_url
    click_on "New advance molecular rheometer"

    fill_in "Analysis", with: @advance_molecular_rheometer.analysis
    fill_in "Current", with: @advance_molecular_rheometer.current
    fill_in "More", with: @advance_molecular_rheometer.more
    fill_in "Nature", with: @advance_molecular_rheometer.nature
    fill_in "Sample", with: @advance_molecular_rheometer.sample
    fill_in "Shear rate", with: @advance_molecular_rheometer.shear_rate
    fill_in "Shear type", with: @advance_molecular_rheometer.shear_type
    fill_in "Size", with: @advance_molecular_rheometer.size
    fill_in "Sweeps", with: @advance_molecular_rheometer.sweeps
    fill_in "Temperature", with: @advance_molecular_rheometer.temperature
    fill_in "Toxicity", with: @advance_molecular_rheometer.toxicity
    fill_in "Type", with: @advance_molecular_rheometer.type
    click_on "Create Advance molecular rheometer"

    assert_text "Advance molecular rheometer was successfully created"
    click_on "Back"
  end

  test "should update Advance molecular rheometer" do
    visit advance_molecular_rheometer_url(@advance_molecular_rheometer)
    click_on "Edit this advance molecular rheometer", match: :first

    fill_in "Analysis", with: @advance_molecular_rheometer.analysis
    fill_in "Current", with: @advance_molecular_rheometer.current
    fill_in "More", with: @advance_molecular_rheometer.more
    fill_in "Nature", with: @advance_molecular_rheometer.nature
    fill_in "Sample", with: @advance_molecular_rheometer.sample
    fill_in "Shear rate", with: @advance_molecular_rheometer.shear_rate
    fill_in "Shear type", with: @advance_molecular_rheometer.shear_type
    fill_in "Size", with: @advance_molecular_rheometer.size
    fill_in "Sweeps", with: @advance_molecular_rheometer.sweeps
    fill_in "Temperature", with: @advance_molecular_rheometer.temperature
    fill_in "Toxicity", with: @advance_molecular_rheometer.toxicity
    fill_in "Type", with: @advance_molecular_rheometer.type
    click_on "Update Advance molecular rheometer"

    assert_text "Advance molecular rheometer was successfully updated"
    click_on "Back"
  end

  test "should destroy Advance molecular rheometer" do
    visit advance_molecular_rheometer_url(@advance_molecular_rheometer)
    click_on "Destroy this advance molecular rheometer", match: :first

    assert_text "Advance molecular rheometer was successfully destroyed"
  end
end
