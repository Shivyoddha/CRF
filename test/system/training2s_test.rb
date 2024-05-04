require "application_system_test_case"

class Training2sTest < ApplicationSystemTestCase
  setup do
    @training2 = training2s(:one)
  end

  test "visiting the index" do
    visit training2s_url
    assert_selector "h1", text: "Training2s"
  end

  test "creating a Training2" do
    visit training2s_url
    click_on "New Training2"

    click_on "Create Training2"

    assert_text "Training2 was successfully created"
    click_on "Back"
  end

  test "updating a Training2" do
    visit training2s_url
    click_on "Edit", match: :first

    click_on "Update Training2"

    assert_text "Training2 was successfully updated"
    click_on "Back"
  end

  test "destroying a Training2" do
    visit training2s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Training2 was successfully destroyed"
  end
end
