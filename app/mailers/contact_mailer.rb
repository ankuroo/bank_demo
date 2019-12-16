class ContactMailer < ApplicationMailer

    # Sends the email with user input content
    def contact_email(name, email, message)
        @name = name
        @email = email
        @message = message

        mail cc: @email
    end

end
