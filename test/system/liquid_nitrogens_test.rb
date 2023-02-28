require "application_system_test_case"

class LiquidNitrogensTest < ApplicationSystemTestCase
  setup do
    @liquid_nitrogen = liquid_nitrogens(:one)
  end

  test "visiting the index" do
    visit liquid_nitrogens_url
    assert_selector "h1", text: "Liquid Nitrogens"
  end

  test "creating a Liquid nitrogen" do
    visit liquid_nitrogens_url
    click_on "New Liquid Nitrogen"

    fill_in "Debit", with: @liquid_nitrogen.debit
    fill_in "More", with: @liquid_nitrogen.more
    fill_in "Purpose", with: @liquid_nitrogen.purpose
    fill_in "Quantity", with: @liquid_nitrogen.quantity
    fill_in "Slotdate", with: @liquid_nitrogen.slotdate
    fill_in "Slottime", with: @liquid_nitrogen.slottime
    fill_in "Status", with: @liquid_nitrogen.status
    click_on "Create Liquid nitrogen"

    assert_text "Liquid nitrogen was successfully created"
    click_on "Back"
  end

  test "updating a Liquid nitrogen" do
    visit liquid_nitrogens_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @liquid_nitrogen.debit
    fill_in "More", with: @liquid_nitrogen.more
    fill_in "Purpose", with: @liquid_nitrogen.purpose
    fill_in "Quantity", with: @liquid_nitrogen.quantity
    fill_in "Slotdate", with: @liquid_nitrogen.slotdate
    fill_in "Slottime", with: @liquid_nitrogen.slottime
    fill_in "Status", with: @liquid_nitrogen.status
    click_on "Update Liquid nitrogen"

    assert_text "Liquid nitrogen was successfully updated"
    click_on "Back"
  end

  test "destroying a Liquid nitrogen" do
    visit liquid_nitrogens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liquid nitrogen was successfully destroyed"
  end
end
