# Model for the content of the contact form
class Contact < MailForm::Base
  # Attributes with validation
  # Name, email and message must exist, with an email being of a certain format.
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true

  # Creates a default header for emails
  def headers
    {
      :subject => "Contact",
      :to => "am02412@surrey.ac.uk",
      :from => %("#{name}" <#{email}>)
    }
  end
end