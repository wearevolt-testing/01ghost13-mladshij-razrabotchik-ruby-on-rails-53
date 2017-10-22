# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.raise_delivery_errors = true
if Rails.env.development?
  ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.gmail.com',
      :domain         => 'mail.google.com',
      :port           => 587,
      :user_name      => 'derpyaitscore@gmail.com',
      :password       => 'animespirit',
      :authentication => :plain,
      :enable_starttls_auto => true
  }
else
  ActionMailer::Base.smtp_settings = {
      :address        => ENV['MAILGUN_SMTP_SERVER'],
      :domain         => ENV['MAILGUN_DOMAIN'],
      :port           => ENV['MAILGUN_SMTP_PORT'],
      :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
      :password       => ENV['MAILGUN_SMTP_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
  }
end
