class ApplicationMailer < ActionMailer::Base
  # Sets defaults for emails
  default to: 'admin@csb.com', from: 'sender@mail.com'
  layout 'mailer'
end
