class ContactsController < ApplicationController

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to root_path
      @success = true
    else
      @success = false
    end
  end
  
   #def create
  #  @contact = Contact.new(contact_params)
  #  if @contact.save
  #    @success = true
  #    render "/home/_form_contact", layout: nil
  #  else
  #    @success = false
  #    render "/home/_form_contact", layout: nil
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :message, :phone)
    end
end
