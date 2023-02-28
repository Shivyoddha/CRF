require "application_system_test_case"

class TribometersTest < ApplicationSystemTestCase
  setup do
    @tribometer = tribometers(:one)
  end

  test "visiting the index" do
    visit tribometers_url
    assert_selector "h1", text: "Tribometers"
  end

  test "creating a Tribometer" do
    visit tribometers_url
    click_on "New Tribometer"

    fill_in "Indenter", with: @tribometer.indenter
    fill_in "Loading", with: @tribometer.loading
    fill_in "Measurement", with: @tribometer.measurement
    fill_in "More", with: @tribometer.more
    fill_in "Sample", with: @tribometer.sample
    fill_in "Stroke", with: @tribometer.stroke
    fill_in "Stype", with: @tribometer.stype
    fill_in "Temp req", with: @tribometer.temp_req
    click_on "Create Tribometer"

    assert_text "Tribometer was successfully created"
    click_on "Back"
  end

  test "updating a Tribometer" do
    visit tribometers_url
    click_on "Edit", match: :first

    fill_in "Indenter", with: @tribometer.indenter
    fill_in "Loading", with: @tribometer.loading
    fill_in "Measurement", with: @tribometer.measurement
    fill_in "More", with: @tribometer.more
    fill_in "Sample", with: @tribometer.sample
    fill_in "Stroke", with: @tribometer.stroke
    fill_in "Stype", with: @tribometer.stype
    fill_in "Temp req", with: @tribometer.temp_req
    click_on "Update Tribometer"

    assert_text "Tribometer was successfully updated"
    click_on "Back"
  end

  test "destroying a Tribometer" do
    visit tribometers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tribometer was successfully destroyed"
  end
end
