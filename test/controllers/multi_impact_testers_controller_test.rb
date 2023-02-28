require "test_helper"

class MultiImpactTestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multi_impact_tester = multi_impact_testers(:one)
  end

  test "should get index" do
    get multi_impact_testers_url
    assert_response :success
  end

  test "should get new" do
    get new_multi_impact_tester_url
    assert_response :success
  end

  test "should create multi_impact_tester" do
    assert_difference('MultiImpactTester.count') do
      post multi_impact_testers_url, params: { multi_impact_tester: { bird_shape: @multi_impact_tester.bird_shape, bird_velocity: @multi_impact_tester.bird_velocity, bullet_shape: @multi_impact_tester.bullet_shape, bullet_velocity: @multi_impact_tester.bullet_velocity, debit: @multi_impact_tester.debit, drop_range: @multi_impact_tester.drop_range, drop_shape: @multi_impact_tester.drop_shape, drop_temp: @multi_impact_tester.drop_temp, drop_velocity: @multi_impact_tester.drop_velocity, measuerment: @multi_impact_tester.measuerment, more: @multi_impact_tester.more, sample: @multi_impact_tester.sample, shpb_lenght: @multi_impact_tester.shpb_lenght, shpb_temp: @multi_impact_tester.shpb_temp, size: @multi_impact_tester.size, slotdate: @multi_impact_tester.slotdate, slottime: @multi_impact_tester.slottime, status: @multi_impact_tester.status, stype: @multi_impact_tester.stype } }
    end

    assert_redirected_to multi_impact_tester_url(MultiImpactTester.last)
  end

  test "should show multi_impact_tester" do
    get multi_impact_tester_url(@multi_impact_tester)
    assert_response :success
  end

  test "should get edit" do
    get edit_multi_impact_tester_url(@multi_impact_tester)
    assert_response :success
  end

  test "should update multi_impact_tester" do
    patch multi_impact_tester_url(@multi_impact_tester), params: { multi_impact_tester: { bird_shape: @multi_impact_tester.bird_shape, bird_velocity: @multi_impact_tester.bird_velocity, bullet_shape: @multi_impact_tester.bullet_shape, bullet_velocity: @multi_impact_tester.bullet_velocity, debit: @multi_impact_tester.debit, drop_range: @multi_impact_tester.drop_range, drop_shape: @multi_impact_tester.drop_shape, drop_temp: @multi_impact_tester.drop_temp, drop_velocity: @multi_impact_tester.drop_velocity, measuerment: @multi_impact_tester.measuerment, more: @multi_impact_tester.more, sample: @multi_impact_tester.sample, shpb_lenght: @multi_impact_tester.shpb_lenght, shpb_temp: @multi_impact_tester.shpb_temp, size: @multi_impact_tester.size, slotdate: @multi_impact_tester.slotdate, slottime: @multi_impact_tester.slottime, status: @multi_impact_tester.status, stype: @multi_impact_tester.stype } }
    assert_redirected_to multi_impact_tester_url(@multi_impact_tester)
  end

  test "should destroy multi_impact_tester" do
    assert_difference('MultiImpactTester.count', -1) do
      delete multi_impact_tester_url(@multi_impact_tester)
    end

    assert_redirected_to multi_impact_testers_url
  end
end
