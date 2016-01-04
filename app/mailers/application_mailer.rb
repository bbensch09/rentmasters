class ApplicationMailer < ActionMailer::Base
  default from: 'rentmasters.sf@gmail.com',
		bcc: 'rentmasters.sf@gmail.com'


  layout 'mailer'
end
