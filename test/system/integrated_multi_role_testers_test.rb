require "application_system_test_case"

class IntegratedMultiRoleTestersTest < ApplicationSystemTestCase
  setup do
    @integrated_multi_role_tester = integrated_multi_role_testers(:one)
  end

  test "visiting the index" do
    visit integrated_multi_role_testers_url
    assert_selector "h1", text: "Integrated multi role testers"
  end

  test "should create integrated multi role tester" do
    visit integrated_multi_role_testers_url
    click_on "New integrated multi role tester"

    fill_in "Analysis", with: @integrated_multi_role_tester.analysis
    fill_in "Loading", with: @integrated_multi_role_tester.loading
    fill_in "Measurement", with: @integrated_multi_role_tester.measurement
    fill_in "More", with: @integrated_multi_role_tester.more
    fill_in "Sample", with: @integrated_multi_role_tester.sample
    fill_in "Temperature", with: @integrated_multi_role_tester.temperature
    fill_in "Type", with: @integrated_multi_role_tester.type
    click_on "Create Integrated multi role tester"

    assert_text "Integrated multi role tester was successfully created"
    click_on "Back"
  end

  test "should update Integrated multi role tester" do
    visit integrated_multi_role_tester_url(@integrated_multi_role_tester)
    click_on "Edit this integrated multi role tester", match: :first

    fill_in "Analysis", with: @integrated_multi_role_tester.analysis
    fill_in "Loading", with: @integrated_multi_role_tester.loading
    fill_in "Measurement", with: @integrated_multi_role_tester.measurement
    fill_in "More", with: @integrated_multi_role_tester.more
    fill_in "Sample", with: @integrated_multi_role_tester.sample
    fill_in "Temperature", with: @integrated_multi_role_tester.temperature
    fill_in "Type", with: @integrated_multi_role_tester.type
    click_on "Update Integrated multi role tester"

    assert_text "Integrated multi role tester was successfully updated"
    click_on "Back"
  end

  test "should destroy Integrated multi role tester" do
    visit integrated_multi_role_tester_url(@integrated_multi_role_tester)
    click_on "Destroy this integrated multi role tester", match: :first

    assert_text "Integrated multi role tester was successfully destroyed"
  end
end
