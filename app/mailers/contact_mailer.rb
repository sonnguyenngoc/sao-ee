class ContactMailer < ApplicationMailer
  default from: 'sonnn@hoangkhang.com.vn'
  
  def contact_email(contact)
    @contact = contact
    mail(to: "sonnn@hoangkhang.com.vn", subject: "Contact - SAO-EE.VN")
  end
end
