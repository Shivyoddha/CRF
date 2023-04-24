class SlotbookerProbeSonicatorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.slotbooker_probe_sonicator_mailer.Mail.subject
  #
  def Mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
