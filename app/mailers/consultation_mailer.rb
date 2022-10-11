class ConsultationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.consultation_mailer.consultation_mailer.subject
  #
  def consultation_mailer
    @greeting = "Hi"
    @user = params[:user]
    @consultation = params[:consultation]
    mail(
    from: "Marcin <prmapp@support.com>",
    to: @user.email,
    subject: 'Test email'
    )
  end

  def consultation_reminder
    @user = params[:user]
    @consultation = params[:consultation]

    if consultation.start_time == Time.current

      mail(
        from: "Marcin <prmapp@support.com>",
        to: @user.email,
        subject: 'You got consultation today!'
        )

    end
  end
end