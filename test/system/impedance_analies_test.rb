require "application_system_test_case"

class ImpedanceAnaliesTest < ApplicationSystemTestCase
  setup do
    @impedance_analy = impedance_analies(:one)
  end

  test "visiting the index" do
    visit impedance_analies_url
    assert_selector "h1", text: "Impedance Analies"
  end

  test "creating a Impedance analy" do
    visit impedance_analies_url
    click_on "New Impedance Analy"

    fill_in "Capacitance", with: @impedance_analy.capacitance
    fill_in "Composition", with: @impedance_analy.composition
    fill_in "Currentrange", with: @impedance_analy.currentrange
    fill_in "Debit", with: @impedance_analy.debit
    fill_in "Dielectric", with: @impedance_analy.dielectric
    fill_in "Freqrange", with: @impedance_analy.freqrange
    fill_in "Impedance", with: @impedance_analy.impedance
    fill_in "Iv", with: @impedance_analy.iv
    fill_in "More", with: @impedance_analy.more
    fill_in "Sample", with: @impedance_analy.sample
    fill_in "Slotdate", with: @impedance_analy.slotdate
    fill_in "Slottime", with: @impedance_analy.slottime
    fill_in "Status", with: @impedance_analy.status
    fill_in "Voltagerange", with: @impedance_analy.voltagerange
    click_on "Create Impedance analy"

    assert_text "Impedance analy was successfully created"
    click_on "Back"
  end

  test "updating a Impedance analy" do
    visit impedance_analies_url
    click_on "Edit", match: :first

    fill_in "Capacitance", with: @impedance_analy.capacitance
    fill_in "Composition", with: @impedance_analy.composition
    fill_in "Currentrange", with: @impedance_analy.currentrange
    fill_in "Debit", with: @impedance_analy.debit
    fill_in "Dielectric", with: @impedance_analy.dielectric
    fill_in "Freqrange", with: @impedance_analy.freqrange
    fill_in "Impedance", with: @impedance_analy.impedance
    fill_in "Iv", with: @impedance_analy.iv
    fill_in "More", with: @impedance_analy.more
    fill_in "Sample", with: @impedance_analy.sample
    fill_in "Slotdate", with: @impedance_analy.slotdate
    fill_in "Slottime", with: @impedance_analy.slottime
    fill_in "Status", with: @impedance_analy.status
    fill_in "Voltagerange", with: @impedance_analy.voltagerange
    click_on "Update Impedance analy"

    assert_text "Impedance analy was successfully updated"
    click_on "Back"
  end

  test "destroying a Impedance analy" do
    visit impedance_analies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Impedance analy was successfully destroyed"
  end
end
