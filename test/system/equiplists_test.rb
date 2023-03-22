require "application_system_test_case"

class EquiplistsTest < ApplicationSystemTestCase
  setup do
    @equiplist = equiplists(:one)
  end

  test "visiting the index" do
    visit equiplists_url
    assert_selector "h1", text: "Equiplists"
  end

  test "creating a Equiplist" do
    visit equiplists_url
    click_on "New Equiplist"

    fill_in "Calibrate", with: @equiplist.calibrate
    fill_in "Name", with: @equiplist.name
    fill_in "Status", with: @equiplist.status
    click_on "Create Equiplist"

    assert_text "Equiplist was successfully created"
    click_on "Back"
  end

  test "updating a Equiplist" do
    visit equiplists_url
    click_on "Edit", match: :first

    fill_in "Calibrate", with: @equiplist.calibrate
    fill_in "Name", with: @equiplist.name
    fill_in "Status", with: @equiplist.status
    click_on "Update Equiplist"

    assert_text "Equiplist was successfully updated"
    click_on "Back"
  end

  test "destroying a Equiplist" do
    visit equiplists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equiplist was successfully destroyed"
  end
end
