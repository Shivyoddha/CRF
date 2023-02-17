require "test_helper"

class MaithiliMailerTest < ActionMailer::TestCase
  test "anish" do
    mail = MaithiliMailer.anish
    assert_equal "Anish", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
