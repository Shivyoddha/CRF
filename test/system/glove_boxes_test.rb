require "application_system_test_case"

class GloveBoxesTest < ApplicationSystemTestCase
  setup do
    @glove_box = glove_boxes(:one)
  end

  test "visiting the index" do
    visit glove_boxes_url
    assert_selector "h1", text: "Glove Boxes"
  end

  test "creating a Glove box" do
    visit glove_boxes_url
    click_on "New Glove Box"

    fill_in "Carcinogenic", with: @glove_box.carcinogenic
    fill_in "Days", with: @glove_box.days
    fill_in "Debit", with: @glove_box.debit
    fill_in "Incompatible", with: @glove_box.incompatible
    fill_in "More", with: @glove_box.more
    fill_in "Slotdate", with: @glove_box.slotdate
    fill_in "Slottime", with: @glove_box.slottime
    fill_in "Status", with: @glove_box.status
    fill_in "Toxicity", with: @glove_box.toxicity
    fill_in "Weight", with: @glove_box.weight
    click_on "Create Glove box"

    assert_text "Glove box was successfully created"
    click_on "Back"
  end

  test "updating a Glove box" do
    visit glove_boxes_url
    click_on "Edit", match: :first

    fill_in "Carcinogenic", with: @glove_box.carcinogenic
    fill_in "Days", with: @glove_box.days
    fill_in "Debit", with: @glove_box.debit
    fill_in "Incompatible", with: @glove_box.incompatible
    fill_in "More", with: @glove_box.more
    fill_in "Slotdate", with: @glove_box.slotdate
    fill_in "Slottime", with: @glove_box.slottime
    fill_in "Status", with: @glove_box.status
    fill_in "Toxicity", with: @glove_box.toxicity
    fill_in "Weight", with: @glove_box.weight
    click_on "Update Glove box"

    assert_text "Glove box was successfully updated"
    click_on "Back"
  end

  test "destroying a Glove box" do
    visit glove_boxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Glove box was successfully destroyed"
  end
end
