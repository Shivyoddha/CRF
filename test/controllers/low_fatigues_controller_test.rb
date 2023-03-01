require "test_helper"

class LowFatiguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @low_fatigue = low_fatigues(:one)
  end

  test "should get index" do
    get low_fatigues_url
    assert_response :success
  end

  test "should get new" do
    get new_low_fatigue_url
    assert_response :success
  end

  test "should create low_fatigue" do
    assert_difference('LowFatigue.count') do
      post low_fatigues_url, params: { low_fatigue: { debit: @low_fatigue.debit, m1: @low_fatigue.m1, m2: @low_fatigue.m2, m3: @low_fatigue.m3, m4: @low_fatigue.m4, m5: @low_fatigue.m5, more: @low_fatigue.more, sample: @low_fatigue.sample, sc1: @low_fatigue.sc1, sc2: @low_fatigue.sc2, sc3: @low_fatigue.sc3, sc4: @low_fatigue.sc4, sc5: @low_fatigue.sc5, slotdate: @low_fatigue.slotdate, slottime: @low_fatigue.slottime, st1: @low_fatigue.st1, st2: @low_fatigue.st2, st3: @low_fatigue.st3, st4: @low_fatigue.st4, st5: @low_fatigue.st5, status: @low_fatigue.status, tf1: @low_fatigue.tf1, tf2: @low_fatigue.tf2, tf3: @low_fatigue.tf3, tf4: @low_fatigue.tf4, tf5: @low_fatigue.tf5, tt1: @low_fatigue.tt1, tt2: @low_fatigue.tt2, tt3: @low_fatigue.tt3, tt4: @low_fatigue.tt4, tt5: @low_fatigue.tt5 } }
    end

    assert_redirected_to low_fatigue_url(LowFatigue.last)
  end

  test "should show low_fatigue" do
    get low_fatigue_url(@low_fatigue)
    assert_response :success
  end

  test "should get edit" do
    get edit_low_fatigue_url(@low_fatigue)
    assert_response :success
  end

  test "should update low_fatigue" do
    patch low_fatigue_url(@low_fatigue), params: { low_fatigue: { debit: @low_fatigue.debit, m1: @low_fatigue.m1, m2: @low_fatigue.m2, m3: @low_fatigue.m3, m4: @low_fatigue.m4, m5: @low_fatigue.m5, more: @low_fatigue.more, sample: @low_fatigue.sample, sc1: @low_fatigue.sc1, sc2: @low_fatigue.sc2, sc3: @low_fatigue.sc3, sc4: @low_fatigue.sc4, sc5: @low_fatigue.sc5, slotdate: @low_fatigue.slotdate, slottime: @low_fatigue.slottime, st1: @low_fatigue.st1, st2: @low_fatigue.st2, st3: @low_fatigue.st3, st4: @low_fatigue.st4, st5: @low_fatigue.st5, status: @low_fatigue.status, tf1: @low_fatigue.tf1, tf2: @low_fatigue.tf2, tf3: @low_fatigue.tf3, tf4: @low_fatigue.tf4, tf5: @low_fatigue.tf5, tt1: @low_fatigue.tt1, tt2: @low_fatigue.tt2, tt3: @low_fatigue.tt3, tt4: @low_fatigue.tt4, tt5: @low_fatigue.tt5 } }
    assert_redirected_to low_fatigue_url(@low_fatigue)
  end

  test "should destroy low_fatigue" do
    assert_difference('LowFatigue.count', -1) do
      delete low_fatigue_url(@low_fatigue)
    end

    assert_redirected_to low_fatigues_url
  end
end
