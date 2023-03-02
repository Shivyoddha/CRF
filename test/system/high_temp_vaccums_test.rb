require "application_system_test_case"

class HighTempVaccumsTest < ApplicationSystemTestCase
  setup do
    @high_temp_vaccum = high_temp_vaccums(:one)
  end

  test "visiting the index" do
    visit high_temp_vaccums_url
    assert_selector "h1", text: "High Temp Vaccums"
  end

  test "creating a High temp vaccum" do
    visit high_temp_vaccums_url
    click_on "New High Temp Vaccum"

    fill_in "Composition", with: @high_temp_vaccum.composition
    fill_in "Debit", with: @high_temp_vaccum.debit
    fill_in "Endtemp", with: @high_temp_vaccum.endtemp
    fill_in "Gas", with: @high_temp_vaccum.gas
    fill_in "Min1", with: @high_temp_vaccum.min1
    fill_in "Min2", with: @high_temp_vaccum.min2
    fill_in "Min3", with: @high_temp_vaccum.min3
    fill_in "Min4", with: @high_temp_vaccum.min4
    fill_in "Min5", with: @high_temp_vaccum.min5
    fill_in "More", with: @high_temp_vaccum.more
    fill_in "No steps", with: @high_temp_vaccum.no_steps
    fill_in "Req atoms", with: @high_temp_vaccum.req_atoms
    fill_in "Sample", with: @high_temp_vaccum.sample
    fill_in "Samplemelting", with: @high_temp_vaccum.samplemelting
    fill_in "Slotdate", with: @high_temp_vaccum.slotdate
    fill_in "Slottime", with: @high_temp_vaccum.slottime
    fill_in "Starttemp", with: @high_temp_vaccum.starttemp
    fill_in "Status", with: @high_temp_vaccum.status
    fill_in "Temp1", with: @high_temp_vaccum.temp1
    fill_in "Temp2", with: @high_temp_vaccum.temp2
    fill_in "Temp3", with: @high_temp_vaccum.temp3
    fill_in "Temp4", with: @high_temp_vaccum.temp4
    fill_in "Temp5", with: @high_temp_vaccum.temp5
    fill_in "Toxicity", with: @high_temp_vaccum.toxicity
    click_on "Create High temp vaccum"

    assert_text "High temp vaccum was successfully created"
    click_on "Back"
  end

  test "updating a High temp vaccum" do
    visit high_temp_vaccums_url
    click_on "Edit", match: :first

    fill_in "Composition", with: @high_temp_vaccum.composition
    fill_in "Debit", with: @high_temp_vaccum.debit
    fill_in "Endtemp", with: @high_temp_vaccum.endtemp
    fill_in "Gas", with: @high_temp_vaccum.gas
    fill_in "Min1", with: @high_temp_vaccum.min1
    fill_in "Min2", with: @high_temp_vaccum.min2
    fill_in "Min3", with: @high_temp_vaccum.min3
    fill_in "Min4", with: @high_temp_vaccum.min4
    fill_in "Min5", with: @high_temp_vaccum.min5
    fill_in "More", with: @high_temp_vaccum.more
    fill_in "No steps", with: @high_temp_vaccum.no_steps
    fill_in "Req atoms", with: @high_temp_vaccum.req_atoms
    fill_in "Sample", with: @high_temp_vaccum.sample
    fill_in "Samplemelting", with: @high_temp_vaccum.samplemelting
    fill_in "Slotdate", with: @high_temp_vaccum.slotdate
    fill_in "Slottime", with: @high_temp_vaccum.slottime
    fill_in "Starttemp", with: @high_temp_vaccum.starttemp
    fill_in "Status", with: @high_temp_vaccum.status
    fill_in "Temp1", with: @high_temp_vaccum.temp1
    fill_in "Temp2", with: @high_temp_vaccum.temp2
    fill_in "Temp3", with: @high_temp_vaccum.temp3
    fill_in "Temp4", with: @high_temp_vaccum.temp4
    fill_in "Temp5", with: @high_temp_vaccum.temp5
    fill_in "Toxicity", with: @high_temp_vaccum.toxicity
    click_on "Update High temp vaccum"

    assert_text "High temp vaccum was successfully updated"
    click_on "Back"
  end

  test "destroying a High temp vaccum" do
    visit high_temp_vaccums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "High temp vaccum was successfully destroyed"
  end
end
