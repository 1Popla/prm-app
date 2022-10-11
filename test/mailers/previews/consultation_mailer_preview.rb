# Preview all emails at http://localhost:3000/rails/mailers/consultation_mailer
class ConsultationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/consultation_mailer/consultation_mailer
  def consultation_mailer
    ConsultationMailer.with(user: User.first, consultation: Consultation.first).consultation_mailer
  end

end
