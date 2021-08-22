class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <testguru@example.com>}
  layout 'mailer'
end
