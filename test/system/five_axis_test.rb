require "application_system_test_case"

class FiveAxisTest < ApplicationSystemTestCase
  setup do
    @five_axi = five_axis(:one)
  end

  test "visiting the index" do
    visit five_axis_url
    assert_selector "h1", text: "Five Axis"
  end

  test "creating a Five axi" do
    visit five_axis_url
    click_on "New Five Axi"

    fill_in "Cncprogram", with: @five_axi.cncprogram
    fill_in "Debit", with: @five_axi.debit
    fill_in "Depth", with: @five_axi.depth
    fill_in "Feedrate", with: @five_axi.feedrate
    fill_in "Material", with: @five_axi.material
    fill_in "More", with: @five_axi.more
    fill_in "Operation", with: @five_axi.operation
    fill_in "Rotationalspeed", with: @five_axi.rotationalspeed
    fill_in "Sample", with: @five_axi.sample
    fill_in "Slotdate", with: @five_axi.slotdate
    fill_in "Slottime", with: @five_axi.slottime
    fill_in "Specimentolerance", with: @five_axi.specimentolerance
    fill_in "Status", with: @five_axi.status
    fill_in "Tool", with: @five_axi.tool
    click_on "Create Five axi"

    assert_text "Five axi was successfully created"
    click_on "Back"
  end

  test "updating a Five axi" do
    visit five_axis_url
    click_on "Edit", match: :first

    fill_in "Cncprogram", with: @five_axi.cncprogram
    fill_in "Debit", with: @five_axi.debit
    fill_in "Depth", with: @five_axi.depth
    fill_in "Feedrate", with: @five_axi.feedrate
    fill_in "Material", with: @five_axi.material
    fill_in "More", with: @five_axi.more
    fill_in "Operation", with: @five_axi.operation
    fill_in "Rotationalspeed", with: @five_axi.rotationalspeed
    fill_in "Sample", with: @five_axi.sample
    fill_in "Slotdate", with: @five_axi.slotdate
    fill_in "Slottime", with: @five_axi.slottime
    fill_in "Specimentolerance", with: @five_axi.specimentolerance
    fill_in "Status", with: @five_axi.status
    fill_in "Tool", with: @five_axi.tool
    click_on "Update Five axi"

    assert_text "Five axi was successfully updated"
    click_on "Back"
  end

  test "destroying a Five axi" do
    visit five_axis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Five axi was successfully destroyed"
  end
end
