require "application_system_test_case"

class GasSensingsTest < ApplicationSystemTestCase
  setup do
    @gas_sensing = gas_sensings(:one)
  end

  test "visiting the index" do
    visit gas_sensings_url
    assert_selector "h1", text: "Gas Sensings"
  end

  test "creating a Gas sensing" do
    visit gas_sensings_url
    click_on "New Gas Sensing"

    fill_in "Carcinogenic", with: @gas_sensing.carcinogenic
    fill_in "Compatibility", with: @gas_sensing.compatibility
    fill_in "Debit", with: @gas_sensing.debit
    fill_in "Gas", with: @gas_sensing.gas
    fill_in "More", with: @gas_sensing.more
    fill_in "Sample", with: @gas_sensing.sample
    fill_in "Slotdate", with: @gas_sensing.slotdate
    fill_in "Slottime", with: @gas_sensing.slottime
    fill_in "Status", with: @gas_sensing.status
    fill_in "Toxicity", with: @gas_sensing.toxicity
    click_on "Create Gas sensing"

    assert_text "Gas sensing was successfully created"
    click_on "Back"
  end

  test "updating a Gas sensing" do
    visit gas_sensings_url
    click_on "Edit", match: :first

    fill_in "Carcinogenic", with: @gas_sensing.carcinogenic
    fill_in "Compatibility", with: @gas_sensing.compatibility
    fill_in "Debit", with: @gas_sensing.debit
    fill_in "Gas", with: @gas_sensing.gas
    fill_in "More", with: @gas_sensing.more
    fill_in "Sample", with: @gas_sensing.sample
    fill_in "Slotdate", with: @gas_sensing.slotdate
    fill_in "Slottime", with: @gas_sensing.slottime
    fill_in "Status", with: @gas_sensing.status
    fill_in "Toxicity", with: @gas_sensing.toxicity
    click_on "Update Gas sensing"

    assert_text "Gas sensing was successfully updated"
    click_on "Back"
  end

  test "destroying a Gas sensing" do
    visit gas_sensings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gas sensing was successfully destroyed"
  end
end
