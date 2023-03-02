require "application_system_test_case"

class LasersTest < ApplicationSystemTestCase
  setup do
    @laser = lasers(:one)
  end

  test "visiting the index" do
    visit lasers_url
    assert_selector "h1", text: "Lasers"
  end

  test "creating a Laser" do
    visit lasers_url
    click_on "New Laser"

    fill_in "Compatibility", with: @laser.compatibility
    fill_in "Composition", with: @laser.composition
    fill_in "Debit", with: @laser.debit
    fill_in "More", with: @laser.more
    fill_in "Sample", with: @laser.sample
    fill_in "Slotdate", with: @laser.slotdate
    fill_in "Slottime", with: @laser.slottime
    fill_in "Status", with: @laser.status
    fill_in "Stype", with: @laser.stype
    fill_in "Temp points", with: @laser.temp_points
    fill_in "Toxicity", with: @laser.toxicity
    click_on "Create Laser"

    assert_text "Laser was successfully created"
    click_on "Back"
  end

  test "updating a Laser" do
    visit lasers_url
    click_on "Edit", match: :first

    fill_in "Compatibility", with: @laser.compatibility
    fill_in "Composition", with: @laser.composition
    fill_in "Debit", with: @laser.debit
    fill_in "More", with: @laser.more
    fill_in "Sample", with: @laser.sample
    fill_in "Slotdate", with: @laser.slotdate
    fill_in "Slottime", with: @laser.slottime
    fill_in "Status", with: @laser.status
    fill_in "Stype", with: @laser.stype
    fill_in "Temp points", with: @laser.temp_points
    fill_in "Toxicity", with: @laser.toxicity
    click_on "Update Laser"

    assert_text "Laser was successfully updated"
    click_on "Back"
  end

  test "destroying a Laser" do
    visit lasers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Laser was successfully destroyed"
  end
end
