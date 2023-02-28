require "application_system_test_case"

class LowFatiguesTest < ApplicationSystemTestCase
  setup do
    @low_fatigue = low_fatigues(:one)
  end

  test "visiting the index" do
    visit low_fatigues_url
    assert_selector "h1", text: "Low Fatigues"
  end

  test "creating a Low fatigue" do
    visit low_fatigues_url
    click_on "New Low Fatigue"

    fill_in "Debit", with: @low_fatigue.debit
    fill_in "M1", with: @low_fatigue.m1
    fill_in "M2", with: @low_fatigue.m2
    fill_in "M3", with: @low_fatigue.m3
    fill_in "M4", with: @low_fatigue.m4
    fill_in "M5", with: @low_fatigue.m5
    fill_in "More", with: @low_fatigue.more
    fill_in "Sample", with: @low_fatigue.sample
    fill_in "Sc1", with: @low_fatigue.sc1
    fill_in "Sc2", with: @low_fatigue.sc2
    fill_in "Sc3", with: @low_fatigue.sc3
    fill_in "Sc4", with: @low_fatigue.sc4
    fill_in "Sc5", with: @low_fatigue.sc5
    fill_in "Slotdate", with: @low_fatigue.slotdate
    fill_in "Slottime", with: @low_fatigue.slottime
    fill_in "St1", with: @low_fatigue.st1
    fill_in "St2", with: @low_fatigue.st2
    fill_in "St3", with: @low_fatigue.st3
    fill_in "St4", with: @low_fatigue.st4
    fill_in "St5", with: @low_fatigue.st5
    fill_in "Status", with: @low_fatigue.status
    fill_in "Tf1", with: @low_fatigue.tf1
    fill_in "Tf2", with: @low_fatigue.tf2
    fill_in "Tf3", with: @low_fatigue.tf3
    fill_in "Tf4", with: @low_fatigue.tf4
    fill_in "Tf5", with: @low_fatigue.tf5
    fill_in "Tt1", with: @low_fatigue.tt1
    fill_in "Tt2", with: @low_fatigue.tt2
    fill_in "Tt3", with: @low_fatigue.tt3
    fill_in "Tt4", with: @low_fatigue.tt4
    fill_in "Tt5", with: @low_fatigue.tt5
    click_on "Create Low fatigue"

    assert_text "Low fatigue was successfully created"
    click_on "Back"
  end

  test "updating a Low fatigue" do
    visit low_fatigues_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @low_fatigue.debit
    fill_in "M1", with: @low_fatigue.m1
    fill_in "M2", with: @low_fatigue.m2
    fill_in "M3", with: @low_fatigue.m3
    fill_in "M4", with: @low_fatigue.m4
    fill_in "M5", with: @low_fatigue.m5
    fill_in "More", with: @low_fatigue.more
    fill_in "Sample", with: @low_fatigue.sample
    fill_in "Sc1", with: @low_fatigue.sc1
    fill_in "Sc2", with: @low_fatigue.sc2
    fill_in "Sc3", with: @low_fatigue.sc3
    fill_in "Sc4", with: @low_fatigue.sc4
    fill_in "Sc5", with: @low_fatigue.sc5
    fill_in "Slotdate", with: @low_fatigue.slotdate
    fill_in "Slottime", with: @low_fatigue.slottime
    fill_in "St1", with: @low_fatigue.st1
    fill_in "St2", with: @low_fatigue.st2
    fill_in "St3", with: @low_fatigue.st3
    fill_in "St4", with: @low_fatigue.st4
    fill_in "St5", with: @low_fatigue.st5
    fill_in "Status", with: @low_fatigue.status
    fill_in "Tf1", with: @low_fatigue.tf1
    fill_in "Tf2", with: @low_fatigue.tf2
    fill_in "Tf3", with: @low_fatigue.tf3
    fill_in "Tf4", with: @low_fatigue.tf4
    fill_in "Tf5", with: @low_fatigue.tf5
    fill_in "Tt1", with: @low_fatigue.tt1
    fill_in "Tt2", with: @low_fatigue.tt2
    fill_in "Tt3", with: @low_fatigue.tt3
    fill_in "Tt4", with: @low_fatigue.tt4
    fill_in "Tt5", with: @low_fatigue.tt5
    click_on "Update Low fatigue"

    assert_text "Low fatigue was successfully updated"
    click_on "Back"
  end

  test "destroying a Low fatigue" do
    visit low_fatigues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Low fatigue was successfully destroyed"
  end
end
