require "test_helper"

class EquipmentTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_table = equipment_tables(:one)
  end

  test "should get index" do
    get equipment_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_table_url
    assert_response :success
  end

  test "should create equipment_table" do
    assert_difference('EquipmentTable.count') do
      post equipment_tables_url, params: { equipment_table: { app_no: @equipment_table.app_no, debit_head: @equipment_table.debit_head, dummy: @equipment_table.dummy, equipname: @equipment_table.equipname, pay: @equipment_table.pay, slotd: @equipment_table.slotd, slott: @equipment_table.slott, username: @equipment_table.username } }
    end

    assert_redirected_to equipment_table_url(EquipmentTable.last)
  end

  test "should show equipment_table" do
    get equipment_table_url(@equipment_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_table_url(@equipment_table)
    assert_response :success
  end

  test "should update equipment_table" do
    patch equipment_table_url(@equipment_table), params: { equipment_table: { app_no: @equipment_table.app_no, debit_head: @equipment_table.debit_head, dummy: @equipment_table.dummy, equipname: @equipment_table.equipname, pay: @equipment_table.pay, slotd: @equipment_table.slotd, slott: @equipment_table.slott, username: @equipment_table.username } }
    assert_redirected_to equipment_table_url(@equipment_table)
  end

  test "should destroy equipment_table" do
    assert_difference('EquipmentTable.count', -1) do
      delete equipment_table_url(@equipment_table)
    end

    assert_redirected_to equipment_tables_url
  end
end
