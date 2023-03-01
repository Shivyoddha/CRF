# Preview all emails at http://localhost:3000/rails/mailers/cell_imaging_mailer
class CellImagingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cell_imaging_mailer/Mail
  def Mail
    CellImagingMailer.Mail
  end

end
