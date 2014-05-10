require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "login_notifier" do
    mail = Notifier.login_notifier
    assert_equal "Login notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
