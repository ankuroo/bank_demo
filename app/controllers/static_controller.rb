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
            flash[:alert] = I18n.t('static.request_contact.no_email')
        else
            # Sends form content to mailer for sending
            ContactMailer.contact_email(name, email, message).deliver_now
            flash[:notice] = I18n.t('static.request_contact.email_sent')
        end
        redirect_to root_path
    end

end
