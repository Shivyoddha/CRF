# Preview all emails at http://localhost:3000/rails/mailers/uv_vis_nir_mailer
class UvVisNirMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/uv_vis_nir_mailer/Mail
  def Mail
    UvVisNirMailer.Mail
  end

end
