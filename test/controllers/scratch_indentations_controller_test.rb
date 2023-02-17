require "test_helper"

class ScratchIndentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scratch_indentation = scratch_indentations(:one)
  end

  test "should get index" do
    get scratch_indentations_url
    assert_response :success
  end

  test "should get new" do
    get new_scratch_indentation_url
    assert_response :success
  end

  test "should create scratch_indentation" do
    assert_difference("ScratchIndentation.count") do
      post scratch_indentations_url, params: { scratch_indentation: { analysis: @scratch_indentation.analysis, constant_load: @scratch_indentation.constant_load, increment_load: @scratch_indentation.increment_load, measurement: @scratch_indentation.measurement, more: @scratch_indentation.more, number_indentation: @scratch_indentation.number_indentation, progressive_load: @scratch_indentation.progressive_load, sample: @scratch_indentation.sample, stroke: @scratch_indentation.stroke, temperature: @scratch_indentation.temperature, type: @scratch_indentation.type } }
    end

    assert_redirected_to scratch_indentation_url(ScratchIndentation.last)
  end

  test "should show scratch_indentation" do
    get scratch_indentation_url(@scratch_indentation)
    assert_response :success
  end

  test "should get edit" do
    get edit_scratch_indentation_url(@scratch_indentation)
    assert_response :success
  end

  test "should update scratch_indentation" do
    patch scratch_indentation_url(@scratch_indentation), params: { scratch_indentation: { analysis: @scratch_indentation.analysis, constant_load: @scratch_indentation.constant_load, increment_load: @scratch_indentation.increment_load, measurement: @scratch_indentation.measurement, more: @scratch_indentation.more, number_indentation: @scratch_indentation.number_indentation, progressive_load: @scratch_indentation.progressive_load, sample: @scratch_indentation.sample, stroke: @scratch_indentation.stroke, temperature: @scratch_indentation.temperature, type: @scratch_indentation.type } }
    assert_redirected_to scratch_indentation_url(@scratch_indentation)
  end

  test "should destroy scratch_indentation" do
    assert_difference("ScratchIndentation.count", -1) do
      delete scratch_indentation_url(@scratch_indentation)
    end

    assert_redirected_to scratch_indentations_url
  end
end
