class StaticController < ApplicationController

    # Renders homepage
    def home
    end

    # Renders contact form
    def contact
    end

    # Sends contact form
    def request_contact
        name = params[:name]
        email = params[:email]
        message = params[:message]
        if email.blank?
            flash[:alert] = "You must give your email address."
        else
            # Sends form content to mailer for sending
            ContactMailer.contact_email(name, email, message).deliver_now
            flash[:notice] = "Your message has been sent. We will get back to you soon."
        end
        redirect_to root_path
    end

end
