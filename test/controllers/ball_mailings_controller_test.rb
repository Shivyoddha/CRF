require "test_helper"

class BallMailingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ball_mailing = ball_mailings(:one)
  end

  test "should get index" do
    get ball_mailings_url
    assert_response :success
  end

  test "should get new" do
    get new_ball_mailing_url
    assert_response :success
  end

  test "should create ball_mailing" do
    assert_difference('BallMailing.count') do
      post ball_mailings_url, params: { ball_mailing: { btype: @ball_mailing.btype, compatibility: @ball_mailing.compatibility, debit: @ball_mailing.debit, feed: @ball_mailing.feed, grind: @ball_mailing.grind, grinding: @ball_mailing.grinding, hardness: @ball_mailing.hardness, more: @ball_mailing.more, sample: @ball_mailing.sample, size: @ball_mailing.size, slotdate: @ball_mailing.slotdate, slottime: @ball_mailing.slottime, specify: @ball_mailing.specify, speed: @ball_mailing.speed, status: @ball_mailing.status, toxicity: @ball_mailing.toxicity } }
    end

    assert_redirected_to ball_mailing_url(BallMailing.last)
  end

  test "should show ball_mailing" do
    get ball_mailing_url(@ball_mailing)
    assert_response :success
  end

  test "should get edit" do
    get edit_ball_mailing_url(@ball_mailing)
    assert_response :success
  end

  test "should update ball_mailing" do
    patch ball_mailing_url(@ball_mailing), params: { ball_mailing: { btype: @ball_mailing.btype, compatibility: @ball_mailing.compatibility, debit: @ball_mailing.debit, feed: @ball_mailing.feed, grind: @ball_mailing.grind, grinding: @ball_mailing.grinding, hardness: @ball_mailing.hardness, more: @ball_mailing.more, sample: @ball_mailing.sample, size: @ball_mailing.size, slotdate: @ball_mailing.slotdate, slottime: @ball_mailing.slottime, specify: @ball_mailing.specify, speed: @ball_mailing.speed, status: @ball_mailing.status, toxicity: @ball_mailing.toxicity } }
    assert_redirected_to ball_mailing_url(@ball_mailing)
  end

  test "should destroy ball_mailing" do
    assert_difference('BallMailing.count', -1) do
      delete ball_mailing_url(@ball_mailing)
    end

    assert_redirected_to ball_mailings_url
  end
end
