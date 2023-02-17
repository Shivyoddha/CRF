require "application_system_test_case"

class XrdsTest < ApplicationSystemTestCase
  setup do
    @xrd = xrds(:one)
  end

  test "visiting the index" do
    visit xrds_url
    assert_selector "h1", text: "Xrds"
  end

  test "should create xrd" do
    visit xrds_url
    click_on "New xrd"

    fill_in "Composition", with: @xrd.composition
    fill_in "Maxd", with: @xrd.maxd
    fill_in "Measurement", with: @xrd.measurement
    fill_in "Mind", with: @xrd.mind
    fill_in "More", with: @xrd.more
    fill_in "Reference", with: @xrd.reference
    fill_in "Sample", with: @xrd.sample
    fill_in "Stype", with: @xrd.stype
    click_on "Create Xrd"

    assert_text "Xrd was successfully created"
    click_on "Back"
  end

  test "should update Xrd" do
    visit xrd_url(@xrd)
    click_on "Edit this xrd", match: :first

    fill_in "Composition", with: @xrd.composition
    fill_in "Maxd", with: @xrd.maxd
    fill_in "Measurement", with: @xrd.measurement
    fill_in "Mind", with: @xrd.mind
    fill_in "More", with: @xrd.more
    fill_in "Reference", with: @xrd.reference
    fill_in "Sample", with: @xrd.sample
    fill_in "Stype", with: @xrd.stype
    click_on "Update Xrd"

    assert_text "Xrd was successfully updated"
    click_on "Back"
  end

  test "should destroy Xrd" do
    visit xrd_url(@xrd)
    click_on "Destroy this xrd", match: :first

    assert_text "Xrd was successfully destroyed"
  end
end
