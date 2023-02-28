require "test_helper"

class GaitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gait = gaits(:one)
  end

  test "should get index" do
    get gaits_url
    assert_response :success
  end

  test "should get new" do
    get new_gait_url
    assert_response :success
  end

  test "should create gait" do
    assert_difference('Gait.count') do
      post gaits_url, params: { gait: { clinical_trial: @gait.clinical_trial, debit: @gait.debit, force_plate: @gait.force_plate, measurement: @gait.measurement, more: @gait.more, physician: @gait.physician, slotdate: @gait.slotdate, slottime: @gait.slottime, status: @gait.status, subject: @gait.subject, trials: @gait.trials } }
    end

    assert_redirected_to gait_url(Gait.last)
  end

  test "should show gait" do
    get gait_url(@gait)
    assert_response :success
  end

  test "should get edit" do
    get edit_gait_url(@gait)
    assert_response :success
  end

  test "should update gait" do
    patch gait_url(@gait), params: { gait: { clinical_trial: @gait.clinical_trial, debit: @gait.debit, force_plate: @gait.force_plate, measurement: @gait.measurement, more: @gait.more, physician: @gait.physician, slotdate: @gait.slotdate, slottime: @gait.slottime, status: @gait.status, subject: @gait.subject, trials: @gait.trials } }
    assert_redirected_to gait_url(@gait)
  end

  test "should destroy gait" do
    assert_difference('Gait.count', -1) do
      delete gait_url(@gait)
    end

    assert_redirected_to gaits_url
  end
end
