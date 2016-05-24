class ApplicationMailer < ActionMailer::Base
  default from: 'info@rentmasters.co',
		cc: 'info@rentmasters.co'


  layout 'mailer'
end
