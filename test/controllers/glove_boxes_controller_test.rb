require "test_helper"

class GloveBoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glove_box = glove_boxes(:one)
  end

  test "should get index" do
    get glove_boxes_url
    assert_response :success
  end

  test "should get new" do
    get new_glove_box_url
    assert_response :success
  end

  test "should create glove_box" do
    assert_difference('GloveBox.count') do
      post glove_boxes_url, params: { glove_box: { carcinogenic: @glove_box.carcinogenic, days: @glove_box.days, debit: @glove_box.debit, incompatible: @glove_box.incompatible, more: @glove_box.more, slotdate: @glove_box.slotdate, slottime: @glove_box.slottime, status: @glove_box.status, toxicity: @glove_box.toxicity, weight: @glove_box.weight } }
    end

    assert_redirected_to glove_box_url(GloveBox.last)
  end

  test "should show glove_box" do
    get glove_box_url(@glove_box)
    assert_response :success
  end

  test "should get edit" do
    get edit_glove_box_url(@glove_box)
    assert_response :success
  end

  test "should update glove_box" do
    patch glove_box_url(@glove_box), params: { glove_box: { carcinogenic: @glove_box.carcinogenic, days: @glove_box.days, debit: @glove_box.debit, incompatible: @glove_box.incompatible, more: @glove_box.more, slotdate: @glove_box.slotdate, slottime: @glove_box.slottime, status: @glove_box.status, toxicity: @glove_box.toxicity, weight: @glove_box.weight } }
    assert_redirected_to glove_box_url(@glove_box)
  end

  test "should destroy glove_box" do
    assert_difference('GloveBox.count', -1) do
      delete glove_box_url(@glove_box)
    end

    assert_redirected_to glove_boxes_url
  end
end
