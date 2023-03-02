require "test_helper"

class ImpedanceAnaliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @impedance_analy = impedance_analies(:one)
  end

  test "should get index" do
    get impedance_analies_url
    assert_response :success
  end

  test "should get new" do
    get new_impedance_analy_url
    assert_response :success
  end

  test "should create impedance_analy" do
    assert_difference('ImpedanceAnaly.count') do
      post impedance_analies_url, params: { impedance_analy: { capacitance: @impedance_analy.capacitance, composition: @impedance_analy.composition, currentrange: @impedance_analy.currentrange, debit: @impedance_analy.debit, dielectric: @impedance_analy.dielectric, freqrange: @impedance_analy.freqrange, impedance: @impedance_analy.impedance, iv: @impedance_analy.iv, more: @impedance_analy.more, sample: @impedance_analy.sample, slotdate: @impedance_analy.slotdate, slottime: @impedance_analy.slottime, status: @impedance_analy.status, voltagerange: @impedance_analy.voltagerange } }
    end

    assert_redirected_to impedance_analy_url(ImpedanceAnaly.last)
  end

  test "should show impedance_analy" do
    get impedance_analy_url(@impedance_analy)
    assert_response :success
  end

  test "should get edit" do
    get edit_impedance_analy_url(@impedance_analy)
    assert_response :success
  end

  test "should update impedance_analy" do
    patch impedance_analy_url(@impedance_analy), params: { impedance_analy: { capacitance: @impedance_analy.capacitance, composition: @impedance_analy.composition, currentrange: @impedance_analy.currentrange, debit: @impedance_analy.debit, dielectric: @impedance_analy.dielectric, freqrange: @impedance_analy.freqrange, impedance: @impedance_analy.impedance, iv: @impedance_analy.iv, more: @impedance_analy.more, sample: @impedance_analy.sample, slotdate: @impedance_analy.slotdate, slottime: @impedance_analy.slottime, status: @impedance_analy.status, voltagerange: @impedance_analy.voltagerange } }
    assert_redirected_to impedance_analy_url(@impedance_analy)
  end

  test "should destroy impedance_analy" do
    assert_difference('ImpedanceAnaly.count', -1) do
      delete impedance_analy_url(@impedance_analy)
    end

    assert_redirected_to impedance_analies_url
  end
end
