require "application_system_test_case"

class FtNmrsTest < ApplicationSystemTestCase
  setup do
    @ft_nmr = ft_nmrs(:one)
  end

  test "visiting the index" do
    visit ft_nmrs_url
    assert_selector "h1", text: "Ft nmrs"
  end

  test "should create ft nmr" do
    visit ft_nmrs_url
    click_on "New ft nmr"

    fill_in "Health", with: @ft_nmr.health
    fill_in "More", with: @ft_nmr.more
    fill_in "Sample", with: @ft_nmr.sample
    fill_in "Sample nature", with: @ft_nmr.sample_nature
    fill_in "Sample phase", with: @ft_nmr.sample_phase
    fill_in "Storage", with: @ft_nmr.storage
    fill_in "Toxicity", with: @ft_nmr.toxicity
    click_on "Create Ft nmr"

    assert_text "Ft nmr was successfully created"
    click_on "Back"
  end

  test "should update Ft nmr" do
    visit ft_nmr_url(@ft_nmr)
    click_on "Edit this ft nmr", match: :first

    fill_in "Health", with: @ft_nmr.health
    fill_in "More", with: @ft_nmr.more
    fill_in "Sample", with: @ft_nmr.sample
    fill_in "Sample nature", with: @ft_nmr.sample_nature
    fill_in "Sample phase", with: @ft_nmr.sample_phase
    fill_in "Storage", with: @ft_nmr.storage
    fill_in "Toxicity", with: @ft_nmr.toxicity
    click_on "Update Ft nmr"

    assert_text "Ft nmr was successfully updated"
    click_on "Back"
  end

  test "should destroy Ft nmr" do
    visit ft_nmr_url(@ft_nmr)
    click_on "Destroy this ft nmr", match: :first

    assert_text "Ft nmr was successfully destroyed"
  end
end
