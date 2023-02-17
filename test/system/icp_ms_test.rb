require "application_system_test_case"

class IcpMsTest < ApplicationSystemTestCase
  setup do
    @icp_m = icp_ms(:one)
  end

  test "visiting the index" do
    visit icp_ms_url
    assert_selector "h1", text: "Icp ms"
  end

  test "should create icp m" do
    visit icp_ms_url
    click_on "New icp m"

    fill_in "Compatibility", with: @icp_m.compatibility
    fill_in "Composition", with: @icp_m.composition
    fill_in "Concentration", with: @icp_m.concentration
    fill_in "Hazard", with: @icp_m.hazard
    fill_in "More", with: @icp_m.more
    fill_in "Nature", with: @icp_m.nature
    fill_in "Sample", with: @icp_m.sample
    fill_in "Sample phase", with: @icp_m.sample_phase
    fill_in "Storage", with: @icp_m.storage
    fill_in "Testing", with: @icp_m.testing
    fill_in "Toxicity", with: @icp_m.toxicity
    click_on "Create Icp m"

    assert_text "Icp m was successfully created"
    click_on "Back"
  end

  test "should update Icp m" do
    visit icp_m_url(@icp_m)
    click_on "Edit this icp m", match: :first

    fill_in "Compatibility", with: @icp_m.compatibility
    fill_in "Composition", with: @icp_m.composition
    fill_in "Concentration", with: @icp_m.concentration
    fill_in "Hazard", with: @icp_m.hazard
    fill_in "More", with: @icp_m.more
    fill_in "Nature", with: @icp_m.nature
    fill_in "Sample", with: @icp_m.sample
    fill_in "Sample phase", with: @icp_m.sample_phase
    fill_in "Storage", with: @icp_m.storage
    fill_in "Testing", with: @icp_m.testing
    fill_in "Toxicity", with: @icp_m.toxicity
    click_on "Update Icp m"

    assert_text "Icp m was successfully updated"
    click_on "Back"
  end

  test "should destroy Icp m" do
    visit icp_m_url(@icp_m)
    click_on "Destroy this icp m", match: :first

    assert_text "Icp m was successfully destroyed"
  end
end
