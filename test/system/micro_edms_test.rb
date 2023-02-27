require "application_system_test_case"

class MicroEdmsTest < ApplicationSystemTestCase
  setup do
    @micro_edm = micro_edms(:one)
  end

  test "visiting the index" do
    visit micro_edms_url
    assert_selector "h1", text: "Micro Edms"
  end

  test "creating a Micro edm" do
    visit micro_edms_url
    click_on "New Micro Edm"

    fill_in "Composition", with: @micro_edm.composition
    fill_in "Debit", with: @micro_edm.debit
    fill_in "Drilling", with: @micro_edm.drilling
    fill_in "Edg", with: @micro_edm.edg
    fill_in "Edm", with: @micro_edm.edm
    fill_in "Milling", with: @micro_edm.milling
    fill_in "More", with: @micro_edm.more
    fill_in "Sample", with: @micro_edm.sample
    fill_in "Slotdate", with: @micro_edm.slotdate
    fill_in "Slottime", with: @micro_edm.slottime
    fill_in "Status", with: @micro_edm.status
    fill_in "Toolelectrode", with: @micro_edm.toolelectrode
    fill_in "Toolmaterial", with: @micro_edm.toolmaterial
    fill_in "Turning", with: @micro_edm.turning
    click_on "Create Micro edm"

    assert_text "Micro edm was successfully created"
    click_on "Back"
  end

  test "updating a Micro edm" do
    visit micro_edms_url
    click_on "Edit", match: :first

    fill_in "Composition", with: @micro_edm.composition
    fill_in "Debit", with: @micro_edm.debit
    fill_in "Drilling", with: @micro_edm.drilling
    fill_in "Edg", with: @micro_edm.edg
    fill_in "Edm", with: @micro_edm.edm
    fill_in "Milling", with: @micro_edm.milling
    fill_in "More", with: @micro_edm.more
    fill_in "Sample", with: @micro_edm.sample
    fill_in "Slotdate", with: @micro_edm.slotdate
    fill_in "Slottime", with: @micro_edm.slottime
    fill_in "Status", with: @micro_edm.status
    fill_in "Toolelectrode", with: @micro_edm.toolelectrode
    fill_in "Toolmaterial", with: @micro_edm.toolmaterial
    fill_in "Turning", with: @micro_edm.turning
    click_on "Update Micro edm"

    assert_text "Micro edm was successfully updated"
    click_on "Back"
  end

  test "destroying a Micro edm" do
    visit micro_edms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Micro edm was successfully destroyed"
  end
end
