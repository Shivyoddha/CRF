require "application_system_test_case"

class UltraCentrifugesTest < ApplicationSystemTestCase
  setup do
    @ultra_centrifuge = ultra_centrifuges(:one)
  end

  test "visiting the index" do
    visit ultra_centrifuges_url
    assert_selector "h1", text: "Ultra Centrifuges"
  end

  test "creating a Ultra centrifuge" do
    visit ultra_centrifuges_url
    click_on "New Ultra Centrifuge"

    fill_in "Carcinogenic", with: @ultra_centrifuge.carcinogenic
    fill_in "Compatibility", with: @ultra_centrifuge.compatibility
    fill_in "Debit", with: @ultra_centrifuge.debit
    fill_in "More", with: @ultra_centrifuge.more
    fill_in "Sample", with: @ultra_centrifuge.sample
    fill_in "Slotdate", with: @ultra_centrifuge.slotdate
    fill_in "Slottime", with: @ultra_centrifuge.slottime
    fill_in "Speed", with: @ultra_centrifuge.speed
    fill_in "Status", with: @ultra_centrifuge.status
    fill_in "Temperature", with: @ultra_centrifuge.temperature
    fill_in "Toxicity", with: @ultra_centrifuge.toxicity
    fill_in "Volume", with: @ultra_centrifuge.volume
    click_on "Create Ultra centrifuge"

    assert_text "Ultra centrifuge was successfully created"
    click_on "Back"
  end

  test "updating a Ultra centrifuge" do
    visit ultra_centrifuges_url
    click_on "Edit", match: :first

    fill_in "Carcinogenic", with: @ultra_centrifuge.carcinogenic
    fill_in "Compatibility", with: @ultra_centrifuge.compatibility
    fill_in "Debit", with: @ultra_centrifuge.debit
    fill_in "More", with: @ultra_centrifuge.more
    fill_in "Sample", with: @ultra_centrifuge.sample
    fill_in "Slotdate", with: @ultra_centrifuge.slotdate
    fill_in "Slottime", with: @ultra_centrifuge.slottime
    fill_in "Speed", with: @ultra_centrifuge.speed
    fill_in "Status", with: @ultra_centrifuge.status
    fill_in "Temperature", with: @ultra_centrifuge.temperature
    fill_in "Toxicity", with: @ultra_centrifuge.toxicity
    fill_in "Volume", with: @ultra_centrifuge.volume
    click_on "Update Ultra centrifuge"

    assert_text "Ultra centrifuge was successfully updated"
    click_on "Back"
  end

  test "destroying a Ultra centrifuge" do
    visit ultra_centrifuges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ultra centrifuge was successfully destroyed"
  end
end
