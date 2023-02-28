require "application_system_test_case"

class SpectroRadioMetersTest < ApplicationSystemTestCase
  setup do
    @spectro_radio_meter = spectro_radio_meters(:one)
  end

  test "visiting the index" do
    visit spectro_radio_meters_url
    assert_selector "h1", text: "Spectro Radio Meters"
  end

  test "creating a Spectro radio meter" do
    visit spectro_radio_meters_url
    click_on "New Spectro Radio Meter"

    fill_in "Application", with: @spectro_radio_meter.application
    fill_in "Debit", with: @spectro_radio_meter.debit
    fill_in "More", with: @spectro_radio_meter.more
    fill_in "Nature", with: @spectro_radio_meter.nature
    fill_in "Sample", with: @spectro_radio_meter.sample
    fill_in "Slotdate", with: @spectro_radio_meter.slotdate
    fill_in "Slottime", with: @spectro_radio_meter.slottime
    fill_in "Status", with: @spectro_radio_meter.status
    fill_in "Stype", with: @spectro_radio_meter.stype
    click_on "Create Spectro radio meter"

    assert_text "Spectro radio meter was successfully created"
    click_on "Back"
  end

  test "updating a Spectro radio meter" do
    visit spectro_radio_meters_url
    click_on "Edit", match: :first

    fill_in "Application", with: @spectro_radio_meter.application
    fill_in "Debit", with: @spectro_radio_meter.debit
    fill_in "More", with: @spectro_radio_meter.more
    fill_in "Nature", with: @spectro_radio_meter.nature
    fill_in "Sample", with: @spectro_radio_meter.sample
    fill_in "Slotdate", with: @spectro_radio_meter.slotdate
    fill_in "Slottime", with: @spectro_radio_meter.slottime
    fill_in "Status", with: @spectro_radio_meter.status
    fill_in "Stype", with: @spectro_radio_meter.stype
    click_on "Update Spectro radio meter"

    assert_text "Spectro radio meter was successfully updated"
    click_on "Back"
  end

  test "destroying a Spectro radio meter" do
    visit spectro_radio_meters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spectro radio meter was successfully destroyed"
  end
end
