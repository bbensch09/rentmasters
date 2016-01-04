class UserMailer < ApplicationMailer

  default from: 'rentmasters.sf@gmail.com'
		bcc: 'rentmasters.sf@gmail.com'

	def welcome_email(user)
		@user = @quote.first_name
		@url  = 'http://www.rentmasters.co/quotes/'+@quote.slug
		mail(to: @user.email, subject: 'Welcome to Rent Masters')
	end
end
