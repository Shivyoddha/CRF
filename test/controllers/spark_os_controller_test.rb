require "test_helper"

class SparkOsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spark_o = spark_os(:one)
  end

  test "should get index" do
    get spark_os_url
    assert_response :success
  end

  test "should get new" do
    get new_spark_o_url
    assert_response :success
  end

  test "should create spark_o" do
    assert_difference('SparkO.count') do
      post spark_os_url, params: { spark_o: { composition: @spark_o.composition, debit: @spark_o.debit, more: @spark_o.more, sample: @spark_o.sample, sampleal: @spark_o.sampleal, samplecu: @spark_o.samplecu, samplefe: @spark_o.samplefe, samplemg: @spark_o.samplemg, sampleni: @spark_o.sampleni, samplepb: @spark_o.samplepb, samplesn: @spark_o.samplesn, sampleti: @spark_o.sampleti, samplezn: @spark_o.samplezn, slotdate: @spark_o.slotdate, slottime: @spark_o.slottime, status: @spark_o.status } }
    end

    assert_redirected_to spark_o_url(SparkO.last)
  end

  test "should show spark_o" do
    get spark_o_url(@spark_o)
    assert_response :success
  end

  test "should get edit" do
    get edit_spark_o_url(@spark_o)
    assert_response :success
  end

  test "should update spark_o" do
    patch spark_o_url(@spark_o), params: { spark_o: { composition: @spark_o.composition, debit: @spark_o.debit, more: @spark_o.more, sample: @spark_o.sample, sampleal: @spark_o.sampleal, samplecu: @spark_o.samplecu, samplefe: @spark_o.samplefe, samplemg: @spark_o.samplemg, sampleni: @spark_o.sampleni, samplepb: @spark_o.samplepb, samplesn: @spark_o.samplesn, sampleti: @spark_o.sampleti, samplezn: @spark_o.samplezn, slotdate: @spark_o.slotdate, slottime: @spark_o.slottime, status: @spark_o.status } }
    assert_redirected_to spark_o_url(@spark_o)
  end

  test "should destroy spark_o" do
    assert_difference('SparkO.count', -1) do
      delete spark_o_url(@spark_o)
    end

    assert_redirected_to spark_os_url
  end
end
