require "application_system_test_case"

class TgaFttrsTest < ApplicationSystemTestCase
  setup do
    @tga_fttr = tga_fttrs(:one)
  end

  test "visiting the index" do
    visit tga_fttrs_url
    assert_selector "h1", text: "Tga fttrs"
  end

  test "should create tga fttr" do
    visit tga_fttrs_url
    click_on "New tga fttr"

    fill_in "Atmosphere", with: @tga_fttr.atmosphere
    fill_in "Carcinogenic", with: @tga_fttr.carcinogenic
    fill_in "Compatability", with: @tga_fttr.compatability
    fill_in "Description", with: @tga_fttr.description
    fill_in "Explosive", with: @tga_fttr.explosive
    fill_in "Hazard", with: @tga_fttr.hazard
    fill_in "Max temp", with: @tga_fttr.max_temp
    fill_in "Measurement", with: @tga_fttr.measurement
    fill_in "Min temp", with: @tga_fttr.min_temp
    fill_in "More", with: @tga_fttr.more
    fill_in "Nature", with: @tga_fttr.nature
    fill_in "Sample", with: @tga_fttr.sample
    fill_in "Scan rate", with: @tga_fttr.scan_rate
    fill_in "Stype", with: @tga_fttr.stype
    click_on "Create Tga fttr"

    assert_text "Tga fttr was successfully created"
    click_on "Back"
  end

  test "should update Tga fttr" do
    visit tga_fttr_url(@tga_fttr)
    click_on "Edit this tga fttr", match: :first

    fill_in "Atmosphere", with: @tga_fttr.atmosphere
    fill_in "Carcinogenic", with: @tga_fttr.carcinogenic
    fill_in "Compatability", with: @tga_fttr.compatability
    fill_in "Description", with: @tga_fttr.description
    fill_in "Explosive", with: @tga_fttr.explosive
    fill_in "Hazard", with: @tga_fttr.hazard
    fill_in "Max temp", with: @tga_fttr.max_temp
    fill_in "Measurement", with: @tga_fttr.measurement
    fill_in "Min temp", with: @tga_fttr.min_temp
    fill_in "More", with: @tga_fttr.more
    fill_in "Nature", with: @tga_fttr.nature
    fill_in "Sample", with: @tga_fttr.sample
    fill_in "Scan rate", with: @tga_fttr.scan_rate
    fill_in "Stype", with: @tga_fttr.stype
    click_on "Update Tga fttr"

    assert_text "Tga fttr was successfully updated"
    click_on "Back"
  end

  test "should destroy Tga fttr" do
    visit tga_fttr_url(@tga_fttr)
    click_on "Destroy this tga fttr", match: :first

    assert_text "Tga fttr was successfully destroyed"
  end
end
