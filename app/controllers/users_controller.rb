class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
	# debugger
end

def new
	@user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
		flash[:success] = "Thanks for creating an account. Welcome to Rent Masters!"
      	redirect_to @user
  else
  	render 'new'
  end
end

private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end

# enable :sessions
# set :session_secret, 'flashcards_dec31'

# get '/' do
# 	"value = " << session[:value].inspect
# 	erb :'index'
# end

# get '/:value' do
# 	session['value'] = params['value']
# 	erb :"users/login"	
# end

# post '/login' do
# 	puts "The email params are #{params[:email]}"
# 	puts "The password params are #{params[:password]}"
# 	login
# end

# def create
# 	puts "(LOG) The params for registration are #{params[:user]}"
# 	@user = User.create(params[:user])
# 	puts "You have successfully signed up."
# 	render 'profile'
# end

# def login
# 	@user = User.find_by("email = ?", params[:email])	
# 	if @user.nil?
# 		erb :'users/forgot_password' 
# 	elsif @user.password == params[:password]
# 		# give_token
# 		puts "Now logged in."
# 		@user.message = "You are now logged in."
# 		erb :'users/profile'
# 	else
# 		puts "INCORRECT PASSWORD"
# 		erb :'users/forgot_password'
# 	end
# end
