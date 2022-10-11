require "test_helper"

class ConsultationMailerTest < ActionMailer::TestCase
  test "consultation_mailer" do
    mail = ConsultationMailer.consultation_mailer
    assert_equal "Consultation mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
