require 'bcrypt'

class User < ActiveRecord::Base

	has_one :quote

	validates :email, presence: true, uniqueness: {case_sensitive: false}

	has_secure_password

  # # users.password_hash in the database is a :string
  # def password
  # 	@password ||= BCrypt::Password.new(password_hash)
  # end

  # def password=(new_password)
  # 	@password = BCrypt::Password.create(new_password)
  # 	self.password_hash = @password
  # end

  # def create(params)
  # 	puts params
  # 	@user = User.new(params)
  # 	@user.password = params[:password]
  # 	@user.save!
  # end

  # # assign them a random one and mail it to them, asking them to change it
  # def forgot_password
  # 	@user = User.find_by_email(params[:email])
  # 	random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  # 	@user.password = random_password
  # 	@user.save!
  # 	Mailer.create_and_deliver_password_change(@user, random_password)
  # end

  # # Remember to create a migration!
  # def self.authenticate(email, password)
  # 	 # if email and password correspond to a valid user, return that user
  #   # otherwise, return nil
  # end

end
