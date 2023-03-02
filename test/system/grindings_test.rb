require "application_system_test_case"

class GrindingsTest < ApplicationSystemTestCase
  setup do
    @grinding = grindings(:one)
  end

  test "visiting the index" do
    visit grindings_url
    assert_selector "h1", text: "Grindings"
  end

  test "creating a Grinding" do
    visit grindings_url
    click_on "New Grinding"

    fill_in "Debit", with: @grinding.debit
    fill_in "Diameter", with: @grinding.diameter
    fill_in "Diamond", with: @grinding.diamond
    fill_in "Grit", with: @grinding.grit
    fill_in "Lapping", with: @grinding.lapping
    fill_in "More", with: @grinding.more
    fill_in "Mould", with: @grinding.mould
    fill_in "Sample", with: @grinding.sample
    fill_in "Slotdate", with: @grinding.slotdate
    fill_in "Slottime", with: @grinding.slottime
    fill_in "Status", with: @grinding.status
    fill_in "Suspension", with: @grinding.suspension
    click_on "Create Grinding"

    assert_text "Grinding was successfully created"
    click_on "Back"
  end

  test "updating a Grinding" do
    visit grindings_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @grinding.debit
    fill_in "Diameter", with: @grinding.diameter
    fill_in "Diamond", with: @grinding.diamond
    fill_in "Grit", with: @grinding.grit
    fill_in "Lapping", with: @grinding.lapping
    fill_in "More", with: @grinding.more
    fill_in "Mould", with: @grinding.mould
    fill_in "Sample", with: @grinding.sample
    fill_in "Slotdate", with: @grinding.slotdate
    fill_in "Slottime", with: @grinding.slottime
    fill_in "Status", with: @grinding.status
    fill_in "Suspension", with: @grinding.suspension
    click_on "Update Grinding"

    assert_text "Grinding was successfully updated"
    click_on "Back"
  end

  test "destroying a Grinding" do
    visit grindings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grinding was successfully destroyed"
  end
end
