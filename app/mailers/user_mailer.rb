class UserMailer < ApplicationMailer


	def welcome_email(quote)
		#When refactoring / finishing the user login stage, we should only ideally trigger this email once a user has saved their profile and created a login & password.
		#likewise, we are hacking a solution now where we pass in the quote object, and then refer to it as user, which is symantically confusing, but ultimately what we will want to do down the road.
		@user = quote
		@url  = 'http://www.rentmasters.co/quotes/'+@user.slug
		mail(to: @user.email, subject: 'Your Rent Masters estimate is here')
	end
end
