class ContactMailer < ApplicationMailer
  default from: 'info@sao-ee.vn'
  
  def contact_email(contact)
    @contact = contact
    mail(to: "luanpm88@gmail.com", subject: "Contact - SAO-EE.VN")
  end
end
