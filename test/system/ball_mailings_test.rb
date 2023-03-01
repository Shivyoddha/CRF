require "application_system_test_case"

class BallMailingsTest < ApplicationSystemTestCase
  setup do
    @ball_mailing = ball_mailings(:one)
  end

  test "visiting the index" do
    visit ball_mailings_url
    assert_selector "h1", text: "Ball Mailings"
  end

  test "creating a Ball mailing" do
    visit ball_mailings_url
    click_on "New Ball Mailing"

    fill_in "Btype", with: @ball_mailing.btype
    fill_in "Compatibility", with: @ball_mailing.compatibility
    fill_in "Debit", with: @ball_mailing.debit
    fill_in "Feed", with: @ball_mailing.feed
    fill_in "Grind", with: @ball_mailing.grind
    fill_in "Grinding", with: @ball_mailing.grinding
    fill_in "Hardness", with: @ball_mailing.hardness
    fill_in "More", with: @ball_mailing.more
    fill_in "Sample", with: @ball_mailing.sample
    fill_in "Size", with: @ball_mailing.size
    fill_in "Slotdate", with: @ball_mailing.slotdate
    fill_in "Slottime", with: @ball_mailing.slottime
    fill_in "Specify", with: @ball_mailing.specify
    fill_in "Speed", with: @ball_mailing.speed
    fill_in "Status", with: @ball_mailing.status
    fill_in "Toxicity", with: @ball_mailing.toxicity
    click_on "Create Ball mailing"

    assert_text "Ball mailing was successfully created"
    click_on "Back"
  end

  test "updating a Ball mailing" do
    visit ball_mailings_url
    click_on "Edit", match: :first

    fill_in "Btype", with: @ball_mailing.btype
    fill_in "Compatibility", with: @ball_mailing.compatibility
    fill_in "Debit", with: @ball_mailing.debit
    fill_in "Feed", with: @ball_mailing.feed
    fill_in "Grind", with: @ball_mailing.grind
    fill_in "Grinding", with: @ball_mailing.grinding
    fill_in "Hardness", with: @ball_mailing.hardness
    fill_in "More", with: @ball_mailing.more
    fill_in "Sample", with: @ball_mailing.sample
    fill_in "Size", with: @ball_mailing.size
    fill_in "Slotdate", with: @ball_mailing.slotdate
    fill_in "Slottime", with: @ball_mailing.slottime
    fill_in "Specify", with: @ball_mailing.specify
    fill_in "Speed", with: @ball_mailing.speed
    fill_in "Status", with: @ball_mailing.status
    fill_in "Toxicity", with: @ball_mailing.toxicity
    click_on "Update Ball mailing"

    assert_text "Ball mailing was successfully updated"
    click_on "Back"
  end

  test "destroying a Ball mailing" do
    visit ball_mailings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ball mailing was successfully destroyed"
  end
end
