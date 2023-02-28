require "application_system_test_case"

class GaitsTest < ApplicationSystemTestCase
  setup do
    @gait = gaits(:one)
  end

  test "visiting the index" do
    visit gaits_url
    assert_selector "h1", text: "Gaits"
  end

  test "creating a Gait" do
    visit gaits_url
    click_on "New Gait"

    fill_in "Clinical trial", with: @gait.clinical_trial
    fill_in "Debit", with: @gait.debit
    fill_in "Force plate", with: @gait.force_plate
    fill_in "Measurement", with: @gait.measurement
    fill_in "More", with: @gait.more
    fill_in "Physician", with: @gait.physician
    fill_in "Slotdate", with: @gait.slotdate
    fill_in "Slottime", with: @gait.slottime
    fill_in "Status", with: @gait.status
    fill_in "Subject", with: @gait.subject
    fill_in "Trials", with: @gait.trials
    click_on "Create Gait"

    assert_text "Gait was successfully created"
    click_on "Back"
  end

  test "updating a Gait" do
    visit gaits_url
    click_on "Edit", match: :first

    fill_in "Clinical trial", with: @gait.clinical_trial
    fill_in "Debit", with: @gait.debit
    fill_in "Force plate", with: @gait.force_plate
    fill_in "Measurement", with: @gait.measurement
    fill_in "More", with: @gait.more
    fill_in "Physician", with: @gait.physician
    fill_in "Slotdate", with: @gait.slotdate
    fill_in "Slottime", with: @gait.slottime
    fill_in "Status", with: @gait.status
    fill_in "Subject", with: @gait.subject
    fill_in "Trials", with: @gait.trials
    click_on "Update Gait"

    assert_text "Gait was successfully updated"
    click_on "Back"
  end

  test "destroying a Gait" do
    visit gaits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gait was successfully destroyed"
  end
end
