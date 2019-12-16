# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

    # Method to set values and initialise a preview
    def contact_email
        ContactMailer.contact_email("Wade Wilson", "dpool@loganshouse.com", 
            @message="This is a test. Good luck.")
    end

end
