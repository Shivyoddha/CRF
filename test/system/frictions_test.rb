require "application_system_test_case"

class FrictionsTest < ApplicationSystemTestCase
  setup do
    @friction = frictions(:one)
  end

  test "visiting the index" do
    visit frictions_url
    assert_selector "h1", text: "Frictions"
  end

  test "creating a Friction" do
    visit frictions_url
    click_on "New Friction"

    fill_in "Debit", with: @friction.debit
    fill_in "Depth", with: @friction.depth
    fill_in "Material", with: @friction.material
    fill_in "Measurement", with: @friction.measurement
    fill_in "More", with: @friction.more
    fill_in "Otforce", with: @friction.otforce
    fill_in "Pstype", with: @friction.pstype
    fill_in "Ptforce", with: @friction.ptforce
    fill_in "Rspeed", with: @friction.rspeed
    fill_in "Sample", with: @friction.sample
    fill_in "Slotdate", with: @friction.slotdate
    fill_in "Slottime", with: @friction.slottime
    fill_in "Status", with: @friction.status
    fill_in "Tool", with: @friction.tool
    fill_in "Toolnom", with: @friction.toolnom
    fill_in "Wspeed", with: @friction.wspeed
    fill_in "Wtemp", with: @friction.wtemp
    click_on "Create Friction"

    assert_text "Friction was successfully created"
    click_on "Back"
  end

  test "updating a Friction" do
    visit frictions_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @friction.debit
    fill_in "Depth", with: @friction.depth
    fill_in "Material", with: @friction.material
    fill_in "Measurement", with: @friction.measurement
    fill_in "More", with: @friction.more
    fill_in "Otforce", with: @friction.otforce
    fill_in "Pstype", with: @friction.pstype
    fill_in "Ptforce", with: @friction.ptforce
    fill_in "Rspeed", with: @friction.rspeed
    fill_in "Sample", with: @friction.sample
    fill_in "Slotdate", with: @friction.slotdate
    fill_in "Slottime", with: @friction.slottime
    fill_in "Status", with: @friction.status
    fill_in "Tool", with: @friction.tool
    fill_in "Toolnom", with: @friction.toolnom
    fill_in "Wspeed", with: @friction.wspeed
    fill_in "Wtemp", with: @friction.wtemp
    click_on "Update Friction"

    assert_text "Friction was successfully updated"
    click_on "Back"
  end

  test "destroying a Friction" do
    visit frictions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friction was successfully destroyed"
  end
end
