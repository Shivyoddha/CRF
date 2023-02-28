require "application_system_test_case"

class ElectroChemicalsTest < ApplicationSystemTestCase
  setup do
    @electro_chemical = electro_chemicals(:one)
  end

  test "visiting the index" do
    visit electro_chemicals_url
    assert_selector "h1", text: "Electro Chemicals"
  end

  test "creating a Electro chemical" do
    visit electro_chemicals_url
    click_on "New Electro Chemical"

    fill_in "Application", with: @electro_chemical.application
    fill_in "Composition", with: @electro_chemical.composition
    fill_in "Debit", with: @electro_chemical.debit
    fill_in "Electrolyte", with: @electro_chemical.electrolyte
    fill_in "More", with: @electro_chemical.more
    fill_in "Sample", with: @electro_chemical.sample
    fill_in "Slotdate", with: @electro_chemical.slotdate
    fill_in "Slottime", with: @electro_chemical.slottime
    fill_in "Status", with: @electro_chemical.status
    click_on "Create Electro chemical"

    assert_text "Electro chemical was successfully created"
    click_on "Back"
  end

  test "updating a Electro chemical" do
    visit electro_chemicals_url
    click_on "Edit", match: :first

    fill_in "Application", with: @electro_chemical.application
    fill_in "Composition", with: @electro_chemical.composition
    fill_in "Debit", with: @electro_chemical.debit
    fill_in "Electrolyte", with: @electro_chemical.electrolyte
    fill_in "More", with: @electro_chemical.more
    fill_in "Sample", with: @electro_chemical.sample
    fill_in "Slotdate", with: @electro_chemical.slotdate
    fill_in "Slottime", with: @electro_chemical.slottime
    fill_in "Status", with: @electro_chemical.status
    click_on "Update Electro chemical"

    assert_text "Electro chemical was successfully updated"
    click_on "Back"
  end

  test "destroying a Electro chemical" do
    visit electro_chemicals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Electro chemical was successfully destroyed"
  end
end
