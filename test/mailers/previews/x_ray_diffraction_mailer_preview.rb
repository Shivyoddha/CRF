# Preview all emails at http://localhost:3000/rails/mailers/x_ray_diffraction_mailer
class XRayDiffractionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/x_ray_diffraction_mailer/Mail
  def Mail
    XRayDiffractionMailer.Mail
  end

end
