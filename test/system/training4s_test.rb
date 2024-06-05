require "application_system_test_case"

class Training4sTest < ApplicationSystemTestCase
  setup do
    @training4 = training4s(:one)
  end

  test "visiting the index" do
    visit training4s_url
    assert_selector "h1", text: "Training4s"
  end

  test "creating a Training4" do
    visit training4s_url
    click_on "New Training4"

    click_on "Create Training4"

    assert_text "Training4 was successfully created"
    click_on "Back"
  end

  test "updating a Training4" do
    visit training4s_url
    click_on "Edit", match: :first

    click_on "Update Training4"

    assert_text "Training4 was successfully updated"
    click_on "Back"
  end

  test "destroying a Training4" do
    visit training4s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Training4 was successfully destroyed"
  end
end
