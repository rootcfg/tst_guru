class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <ddd2283@gmail.com>}
  layout 'mailer'
end
