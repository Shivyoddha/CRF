require "test_helper"

class HighTempVaccumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @high_temp_vaccum = high_temp_vaccums(:one)
  end

  test "should get index" do
    get high_temp_vaccums_url
    assert_response :success
  end

  test "should get new" do
    get new_high_temp_vaccum_url
    assert_response :success
  end

  test "should create high_temp_vaccum" do
    assert_difference('HighTempVaccum.count') do
      post high_temp_vaccums_url, params: { high_temp_vaccum: { composition: @high_temp_vaccum.composition, debit: @high_temp_vaccum.debit, endtemp: @high_temp_vaccum.endtemp, gas: @high_temp_vaccum.gas, min1: @high_temp_vaccum.min1, min2: @high_temp_vaccum.min2, min3: @high_temp_vaccum.min3, min4: @high_temp_vaccum.min4, min5: @high_temp_vaccum.min5, more: @high_temp_vaccum.more, no_steps: @high_temp_vaccum.no_steps, req_atoms: @high_temp_vaccum.req_atoms, sample: @high_temp_vaccum.sample, samplemelting: @high_temp_vaccum.samplemelting, slotdate: @high_temp_vaccum.slotdate, slottime: @high_temp_vaccum.slottime, starttemp: @high_temp_vaccum.starttemp, status: @high_temp_vaccum.status, temp1: @high_temp_vaccum.temp1, temp2: @high_temp_vaccum.temp2, temp3: @high_temp_vaccum.temp3, temp4: @high_temp_vaccum.temp4, temp5: @high_temp_vaccum.temp5, toxicity: @high_temp_vaccum.toxicity } }
    end

    assert_redirected_to high_temp_vaccum_url(HighTempVaccum.last)
  end

  test "should show high_temp_vaccum" do
    get high_temp_vaccum_url(@high_temp_vaccum)
    assert_response :success
  end

  test "should get edit" do
    get edit_high_temp_vaccum_url(@high_temp_vaccum)
    assert_response :success
  end

  test "should update high_temp_vaccum" do
    patch high_temp_vaccum_url(@high_temp_vaccum), params: { high_temp_vaccum: { composition: @high_temp_vaccum.composition, debit: @high_temp_vaccum.debit, endtemp: @high_temp_vaccum.endtemp, gas: @high_temp_vaccum.gas, min1: @high_temp_vaccum.min1, min2: @high_temp_vaccum.min2, min3: @high_temp_vaccum.min3, min4: @high_temp_vaccum.min4, min5: @high_temp_vaccum.min5, more: @high_temp_vaccum.more, no_steps: @high_temp_vaccum.no_steps, req_atoms: @high_temp_vaccum.req_atoms, sample: @high_temp_vaccum.sample, samplemelting: @high_temp_vaccum.samplemelting, slotdate: @high_temp_vaccum.slotdate, slottime: @high_temp_vaccum.slottime, starttemp: @high_temp_vaccum.starttemp, status: @high_temp_vaccum.status, temp1: @high_temp_vaccum.temp1, temp2: @high_temp_vaccum.temp2, temp3: @high_temp_vaccum.temp3, temp4: @high_temp_vaccum.temp4, temp5: @high_temp_vaccum.temp5, toxicity: @high_temp_vaccum.toxicity } }
    assert_redirected_to high_temp_vaccum_url(@high_temp_vaccum)
  end

  test "should destroy high_temp_vaccum" do
    assert_difference('HighTempVaccum.count', -1) do
      delete high_temp_vaccum_url(@high_temp_vaccum)
    end

    assert_redirected_to high_temp_vaccums_url
  end
end
