class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_X_USERNAME']
  layout 'mailer'
end
