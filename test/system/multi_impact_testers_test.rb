require "application_system_test_case"

class MultiImpactTestersTest < ApplicationSystemTestCase
  setup do
    @multi_impact_tester = multi_impact_testers(:one)
  end

  test "visiting the index" do
    visit multi_impact_testers_url
    assert_selector "h1", text: "Multi Impact Testers"
  end

  test "creating a Multi impact tester" do
    visit multi_impact_testers_url
    click_on "New Multi Impact Tester"

    fill_in "Bird shape", with: @multi_impact_tester.bird_shape
    fill_in "Bird velocity", with: @multi_impact_tester.bird_velocity
    fill_in "Bullet shape", with: @multi_impact_tester.bullet_shape
    fill_in "Bullet velocity", with: @multi_impact_tester.bullet_velocity
    fill_in "Debit", with: @multi_impact_tester.debit
    fill_in "Drop range", with: @multi_impact_tester.drop_range
    fill_in "Drop shape", with: @multi_impact_tester.drop_shape
    fill_in "Drop temp", with: @multi_impact_tester.drop_temp
    fill_in "Drop velocity", with: @multi_impact_tester.drop_velocity
    fill_in "Measuerment", with: @multi_impact_tester.measuerment
    fill_in "More", with: @multi_impact_tester.more
    fill_in "Sample", with: @multi_impact_tester.sample
    fill_in "Shpb lenght", with: @multi_impact_tester.shpb_lenght
    fill_in "Shpb temp", with: @multi_impact_tester.shpb_temp
    fill_in "Size", with: @multi_impact_tester.size
    fill_in "Slotdate", with: @multi_impact_tester.slotdate
    fill_in "Slottime", with: @multi_impact_tester.slottime
    fill_in "Status", with: @multi_impact_tester.status
    fill_in "Stype", with: @multi_impact_tester.stype
    click_on "Create Multi impact tester"

    assert_text "Multi impact tester was successfully created"
    click_on "Back"
  end

  test "updating a Multi impact tester" do
    visit multi_impact_testers_url
    click_on "Edit", match: :first

    fill_in "Bird shape", with: @multi_impact_tester.bird_shape
    fill_in "Bird velocity", with: @multi_impact_tester.bird_velocity
    fill_in "Bullet shape", with: @multi_impact_tester.bullet_shape
    fill_in "Bullet velocity", with: @multi_impact_tester.bullet_velocity
    fill_in "Debit", with: @multi_impact_tester.debit
    fill_in "Drop range", with: @multi_impact_tester.drop_range
    fill_in "Drop shape", with: @multi_impact_tester.drop_shape
    fill_in "Drop temp", with: @multi_impact_tester.drop_temp
    fill_in "Drop velocity", with: @multi_impact_tester.drop_velocity
    fill_in "Measuerment", with: @multi_impact_tester.measuerment
    fill_in "More", with: @multi_impact_tester.more
    fill_in "Sample", with: @multi_impact_tester.sample
    fill_in "Shpb lenght", with: @multi_impact_tester.shpb_lenght
    fill_in "Shpb temp", with: @multi_impact_tester.shpb_temp
    fill_in "Size", with: @multi_impact_tester.size
    fill_in "Slotdate", with: @multi_impact_tester.slotdate
    fill_in "Slottime", with: @multi_impact_tester.slottime
    fill_in "Status", with: @multi_impact_tester.status
    fill_in "Stype", with: @multi_impact_tester.stype
    click_on "Update Multi impact tester"

    assert_text "Multi impact tester was successfully updated"
    click_on "Back"
  end

  test "destroying a Multi impact tester" do
    visit multi_impact_testers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Multi impact tester was successfully destroyed"
  end
end
