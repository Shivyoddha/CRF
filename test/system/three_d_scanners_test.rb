require "application_system_test_case"

class ThreeDScannersTest < ApplicationSystemTestCase
  setup do
    @three_d_scanner = three_d_scanners(:one)
  end

  test "visiting the index" do
    visit three_d_scanners_url
    assert_selector "h1", text: "Three D Scanners"
  end

  test "creating a Three d scanner" do
    visit three_d_scanners_url
    click_on "New Three D Scanner"

    fill_in "Aop", with: @three_d_scanner.aop
    fill_in "Asc", with: @three_d_scanner.asc
    fill_in "Debit", with: @three_d_scanner.debit
    fill_in "More", with: @three_d_scanner.more
    fill_in "Obj", with: @three_d_scanner.obj
    fill_in "Ply", with: @three_d_scanner.ply
    fill_in "Ptx", with: @three_d_scanner.ptx
    fill_in "Sample", with: @three_d_scanner.sample
    fill_in "Size", with: @three_d_scanner.size
    fill_in "Slotdate", with: @three_d_scanner.slotdate
    fill_in "Slottime", with: @three_d_scanner.slottime
    fill_in "Status", with: @three_d_scanner.status
    fill_in "Stt", with: @three_d_scanner.stt
    fill_in "Texture", with: @three_d_scanner.texture
    fill_in "Wrl", with: @three_d_scanner.wrl
    fill_in "Xyzrgb", with: @three_d_scanner.xyzrgb
    click_on "Create Three d scanner"

    assert_text "Three d scanner was successfully created"
    click_on "Back"
  end

  test "updating a Three d scanner" do
    visit three_d_scanners_url
    click_on "Edit", match: :first

    fill_in "Aop", with: @three_d_scanner.aop
    fill_in "Asc", with: @three_d_scanner.asc
    fill_in "Debit", with: @three_d_scanner.debit
    fill_in "More", with: @three_d_scanner.more
    fill_in "Obj", with: @three_d_scanner.obj
    fill_in "Ply", with: @three_d_scanner.ply
    fill_in "Ptx", with: @three_d_scanner.ptx
    fill_in "Sample", with: @three_d_scanner.sample
    fill_in "Size", with: @three_d_scanner.size
    fill_in "Slotdate", with: @three_d_scanner.slotdate
    fill_in "Slottime", with: @three_d_scanner.slottime
    fill_in "Status", with: @three_d_scanner.status
    fill_in "Stt", with: @three_d_scanner.stt
    fill_in "Texture", with: @three_d_scanner.texture
    fill_in "Wrl", with: @three_d_scanner.wrl
    fill_in "Xyzrgb", with: @three_d_scanner.xyzrgb
    click_on "Update Three d scanner"

    assert_text "Three d scanner was successfully updated"
    click_on "Back"
  end

  test "destroying a Three d scanner" do
    visit three_d_scanners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Three d scanner was successfully destroyed"
  end
end
