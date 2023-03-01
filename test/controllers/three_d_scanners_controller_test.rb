require "test_helper"

class ThreeDScannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @three_d_scanner = three_d_scanners(:one)
  end

  test "should get index" do
    get three_d_scanners_url
    assert_response :success
  end

  test "should get new" do
    get new_three_d_scanner_url
    assert_response :success
  end

  test "should create three_d_scanner" do
    assert_difference('ThreeDScanner.count') do
      post three_d_scanners_url, params: { three_d_scanner: { aop: @three_d_scanner.aop, asc: @three_d_scanner.asc, debit: @three_d_scanner.debit, more: @three_d_scanner.more, obj: @three_d_scanner.obj, ply: @three_d_scanner.ply, ptx: @three_d_scanner.ptx, sample: @three_d_scanner.sample, size: @three_d_scanner.size, slotdate: @three_d_scanner.slotdate, slottime: @three_d_scanner.slottime, status: @three_d_scanner.status, stt: @three_d_scanner.stt, texture: @three_d_scanner.texture, wrl: @three_d_scanner.wrl, xyzrgb: @three_d_scanner.xyzrgb } }
    end

    assert_redirected_to three_d_scanner_url(ThreeDScanner.last)
  end

  test "should show three_d_scanner" do
    get three_d_scanner_url(@three_d_scanner)
    assert_response :success
  end

  test "should get edit" do
    get edit_three_d_scanner_url(@three_d_scanner)
    assert_response :success
  end

  test "should update three_d_scanner" do
    patch three_d_scanner_url(@three_d_scanner), params: { three_d_scanner: { aop: @three_d_scanner.aop, asc: @three_d_scanner.asc, debit: @three_d_scanner.debit, more: @three_d_scanner.more, obj: @three_d_scanner.obj, ply: @three_d_scanner.ply, ptx: @three_d_scanner.ptx, sample: @three_d_scanner.sample, size: @three_d_scanner.size, slotdate: @three_d_scanner.slotdate, slottime: @three_d_scanner.slottime, status: @three_d_scanner.status, stt: @three_d_scanner.stt, texture: @three_d_scanner.texture, wrl: @three_d_scanner.wrl, xyzrgb: @three_d_scanner.xyzrgb } }
    assert_redirected_to three_d_scanner_url(@three_d_scanner)
  end

  test "should destroy three_d_scanner" do
    assert_difference('ThreeDScanner.count', -1) do
      delete three_d_scanner_url(@three_d_scanner)
    end

    assert_redirected_to three_d_scanners_url
  end
end
