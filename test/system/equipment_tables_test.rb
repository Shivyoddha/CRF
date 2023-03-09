require "application_system_test_case"

class EquipmentTablesTest < ApplicationSystemTestCase
  setup do
    @equipment_table = equipment_tables(:one)
  end

  test "visiting the index" do
    visit equipment_tables_url
    assert_selector "h1", text: "Equipment Tables"
  end

  test "creating a Equipment table" do
    visit equipment_tables_url
    click_on "New Equipment Table"

    fill_in "App no", with: @equipment_table.app_no
    fill_in "Debit head", with: @equipment_table.debit_head
    fill_in "Dummy", with: @equipment_table.dummy
    fill_in "Equipname", with: @equipment_table.equipname
    fill_in "Pay", with: @equipment_table.pay
    fill_in "Slotd", with: @equipment_table.slotd
    fill_in "Slott", with: @equipment_table.slott
    fill_in "Username", with: @equipment_table.username
    click_on "Create Equipment table"

    assert_text "Equipment table was successfully created"
    click_on "Back"
  end

  test "updating a Equipment table" do
    visit equipment_tables_url
    click_on "Edit", match: :first

    fill_in "App no", with: @equipment_table.app_no
    fill_in "Debit head", with: @equipment_table.debit_head
    fill_in "Dummy", with: @equipment_table.dummy
    fill_in "Equipname", with: @equipment_table.equipname
    fill_in "Pay", with: @equipment_table.pay
    fill_in "Slotd", with: @equipment_table.slotd
    fill_in "Slott", with: @equipment_table.slott
    fill_in "Username", with: @equipment_table.username
    click_on "Update Equipment table"

    assert_text "Equipment table was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipment table" do
    visit equipment_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipment table was successfully destroyed"
  end
end
