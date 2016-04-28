class ContactMailer < ApplicationMailer
  default from: 'info@sao-ee.vn'
  
  def contact_email(contact)
    @contact = contact
    mail(to: "info@sao-ee.vn", subject: "Contact - SAO-EE.VN")
  end
end
