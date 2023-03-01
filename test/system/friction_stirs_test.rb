require "application_system_test_case"

class FrictionStirsTest < ApplicationSystemTestCase
  setup do
    @friction_stir = friction_stirs(:one)
  end

  test "visiting the index" do
    visit friction_stirs_url
    assert_selector "h1", text: "Friction Stirs"
  end

  test "creating a Friction stir" do
    visit friction_stirs_url
    click_on "New Friction Stir"

    fill_in "Debit", with: @friction_stir.debit
    fill_in "Depth", with: @friction_stir.depth
    fill_in "Material", with: @friction_stir.material
    fill_in "Measurement", with: @friction_stir.measurement
    fill_in "More", with: @friction_stir.more
    fill_in "Otforce", with: @friction_stir.otforce
    fill_in "Pstype", with: @friction_stir.pstype
    fill_in "Ptforce", with: @friction_stir.ptforce
    fill_in "Rspeed", with: @friction_stir.rspeed
    fill_in "Sample", with: @friction_stir.sample
    fill_in "Slotdate", with: @friction_stir.slotdate
    fill_in "Slottime", with: @friction_stir.slottime
    fill_in "Status", with: @friction_stir.status
    fill_in "Tool", with: @friction_stir.tool
    fill_in "Toolnom", with: @friction_stir.toolnom
    fill_in "Wspeed", with: @friction_stir.wspeed
    fill_in "Wtemp", with: @friction_stir.wtemp
    click_on "Create Friction stir"

    assert_text "Friction stir was successfully created"
    click_on "Back"
  end

  test "updating a Friction stir" do
    visit friction_stirs_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @friction_stir.debit
    fill_in "Depth", with: @friction_stir.depth
    fill_in "Material", with: @friction_stir.material
    fill_in "Measurement", with: @friction_stir.measurement
    fill_in "More", with: @friction_stir.more
    fill_in "Otforce", with: @friction_stir.otforce
    fill_in "Pstype", with: @friction_stir.pstype
    fill_in "Ptforce", with: @friction_stir.ptforce
    fill_in "Rspeed", with: @friction_stir.rspeed
    fill_in "Sample", with: @friction_stir.sample
    fill_in "Slotdate", with: @friction_stir.slotdate
    fill_in "Slottime", with: @friction_stir.slottime
    fill_in "Status", with: @friction_stir.status
    fill_in "Tool", with: @friction_stir.tool
    fill_in "Toolnom", with: @friction_stir.toolnom
    fill_in "Wspeed", with: @friction_stir.wspeed
    fill_in "Wtemp", with: @friction_stir.wtemp
    click_on "Update Friction stir"

    assert_text "Friction stir was successfully updated"
    click_on "Back"
  end

  test "destroying a Friction stir" do
    visit friction_stirs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friction stir was successfully destroyed"
  end
end
