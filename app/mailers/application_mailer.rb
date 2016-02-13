class ApplicationMailer < ActionMailer::Base
  default from: 'rentmasters.sf@gmail.com',
		cc: 'rentmasters.sf@gmail.com'


  layout 'mailer'
end
