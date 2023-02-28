require "application_system_test_case"

class ProbeSonicatorsTest < ApplicationSystemTestCase
  setup do
    @probe_sonicator = probe_sonicators(:one)
  end

  test "visiting the index" do
    visit probe_sonicators_url
    assert_selector "h1", text: "Probe Sonicators"
  end

  test "creating a Probe sonicator" do
    visit probe_sonicators_url
    click_on "New Probe Sonicator"

    fill_in "Amplitude", with: @probe_sonicator.amplitude
    fill_in "Debit", with: @probe_sonicator.debit
    fill_in "More", with: @probe_sonicator.more
    fill_in "Sample", with: @probe_sonicator.sample
    fill_in "Size", with: @probe_sonicator.size
    fill_in "Slotdate", with: @probe_sonicator.slotdate
    fill_in "Slottime", with: @probe_sonicator.slottime
    fill_in "Status", with: @probe_sonicator.status
    fill_in "Viscosity", with: @probe_sonicator.viscosity
    fill_in "Volume", with: @probe_sonicator.volume
    click_on "Create Probe sonicator"

    assert_text "Probe sonicator was successfully created"
    click_on "Back"
  end

  test "updating a Probe sonicator" do
    visit probe_sonicators_url
    click_on "Edit", match: :first

    fill_in "Amplitude", with: @probe_sonicator.amplitude
    fill_in "Debit", with: @probe_sonicator.debit
    fill_in "More", with: @probe_sonicator.more
    fill_in "Sample", with: @probe_sonicator.sample
    fill_in "Size", with: @probe_sonicator.size
    fill_in "Slotdate", with: @probe_sonicator.slotdate
    fill_in "Slottime", with: @probe_sonicator.slottime
    fill_in "Status", with: @probe_sonicator.status
    fill_in "Viscosity", with: @probe_sonicator.viscosity
    fill_in "Volume", with: @probe_sonicator.volume
    click_on "Update Probe sonicator"

    assert_text "Probe sonicator was successfully updated"
    click_on "Back"
  end

  test "destroying a Probe sonicator" do
    visit probe_sonicators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Probe sonicator was successfully destroyed"
  end
end
