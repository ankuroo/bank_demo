# Handles the contact form and emailing for the contact form
class ContactsController < ApplicationController
    # Renders the contact form page
    def new
        @contact = Contact.new
    end

    # Sends input and creates a mail to send
    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
          flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
        else
          flash.now[:error] = 'Cannot send message.'
          render :new
        end
    end
end