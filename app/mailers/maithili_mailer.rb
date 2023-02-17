class MaithiliMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.maithili_mailer.anish.subject

  def anish
    attachments["love.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'home/anish', layout: 'pdf', pdf: 'filename')
    )
    mail to: "anish.kumbhar04@gmail.com"
  end
end
