require "application_system_test_case"

class GlowsTest < ApplicationSystemTestCase
  setup do
    @glow = glows(:one)
  end

  test "visiting the index" do
    visit glows_url
    assert_selector "h1", text: "Glows"
  end

  test "creating a Glow" do
    visit glows_url
    click_on "New Glow"

    fill_in "Coated", with: @glow.coated
    fill_in "Coated ele", with: @glow.coated_ele
    fill_in "Debit", with: @glow.debit
    fill_in "Elemental", with: @glow.elemental
    fill_in "More", with: @glow.more
    fill_in "Sample", with: @glow.sample
    fill_in "Slotdate", with: @glow.slotdate
    fill_in "Slottime", with: @glow.slottime
    fill_in "Specification", with: @glow.specification
    fill_in "Status", with: @glow.status
    fill_in "Substarte", with: @glow.substarte
    click_on "Create Glow"

    assert_text "Glow was successfully created"
    click_on "Back"
  end

  test "updating a Glow" do
    visit glows_url
    click_on "Edit", match: :first

    fill_in "Coated", with: @glow.coated
    fill_in "Coated ele", with: @glow.coated_ele
    fill_in "Debit", with: @glow.debit
    fill_in "Elemental", with: @glow.elemental
    fill_in "More", with: @glow.more
    fill_in "Sample", with: @glow.sample
    fill_in "Slotdate", with: @glow.slotdate
    fill_in "Slottime", with: @glow.slottime
    fill_in "Specification", with: @glow.specification
    fill_in "Status", with: @glow.status
    fill_in "Substarte", with: @glow.substarte
    click_on "Update Glow"

    assert_text "Glow was successfully updated"
    click_on "Back"
  end

  test "destroying a Glow" do
    visit glows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Glow was successfully destroyed"
  end
end
