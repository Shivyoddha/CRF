require "application_system_test_case"

class BetsTest < ApplicationSystemTestCase
  setup do
    @bet = bets(:one)
  end

  test "visiting the index" do
    visit bets_url
    assert_selector "h1", text: "Bets"
  end

  test "should create bet" do
    visit bets_url
    click_on "New bet"

    fill_in "Analysis", with: @bet.analysis
    fill_in "Degassing", with: @bet.degassing
    fill_in "Disposal", with: @bet.disposal
    fill_in "Incompatibe", with: @bet.incompatibe
    fill_in "More", with: @bet.more
    fill_in "Sample", with: @bet.sample
    fill_in "Toxicity", with: @bet.toxicity
    click_on "Create Bet"

    assert_text "Bet was successfully created"
    click_on "Back"
  end

  test "should update Bet" do
    visit bet_url(@bet)
    click_on "Edit this bet", match: :first

    fill_in "Analysis", with: @bet.analysis
    fill_in "Degassing", with: @bet.degassing
    fill_in "Disposal", with: @bet.disposal
    fill_in "Incompatibe", with: @bet.incompatibe
    fill_in "More", with: @bet.more
    fill_in "Sample", with: @bet.sample
    fill_in "Toxicity", with: @bet.toxicity
    click_on "Update Bet"

    assert_text "Bet was successfully updated"
    click_on "Back"
  end

  test "should destroy Bet" do
    visit bet_url(@bet)
    click_on "Destroy this bet", match: :first

    assert_text "Bet was successfully destroyed"
  end
end
