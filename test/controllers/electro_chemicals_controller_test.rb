require "test_helper"

class ElectroChemicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @electro_chemical = electro_chemicals(:one)
  end

  test "should get index" do
    get electro_chemicals_url
    assert_response :success
  end

  test "should get new" do
    get new_electro_chemical_url
    assert_response :success
  end

  test "should create electro_chemical" do
    assert_difference('ElectroChemical.count') do
      post electro_chemicals_url, params: { electro_chemical: { application: @electro_chemical.application, composition: @electro_chemical.composition, debit: @electro_chemical.debit, electrolyte: @electro_chemical.electrolyte, more: @electro_chemical.more, sample: @electro_chemical.sample, slotdate: @electro_chemical.slotdate, slottime: @electro_chemical.slottime, status: @electro_chemical.status } }
    end

    assert_redirected_to electro_chemical_url(ElectroChemical.last)
  end

  test "should show electro_chemical" do
    get electro_chemical_url(@electro_chemical)
    assert_response :success
  end

  test "should get edit" do
    get edit_electro_chemical_url(@electro_chemical)
    assert_response :success
  end

  test "should update electro_chemical" do
    patch electro_chemical_url(@electro_chemical), params: { electro_chemical: { application: @electro_chemical.application, composition: @electro_chemical.composition, debit: @electro_chemical.debit, electrolyte: @electro_chemical.electrolyte, more: @electro_chemical.more, sample: @electro_chemical.sample, slotdate: @electro_chemical.slotdate, slottime: @electro_chemical.slottime, status: @electro_chemical.status } }
    assert_redirected_to electro_chemical_url(@electro_chemical)
  end

  test "should destroy electro_chemical" do
    assert_difference('ElectroChemical.count', -1) do
      delete electro_chemical_url(@electro_chemical)
    end

    assert_redirected_to electro_chemicals_url
  end
end
