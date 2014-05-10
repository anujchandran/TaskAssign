class User < ActiveRecord::Base
	has_secure_password
	belongs_to :team
	has_many :tasks
	has_many :screen_shots
	scope :sorted, lambda { order("users.first_name ASC")}
	before_create { generate_token(:auth_token) }
	validates :team_id, presence: true


	protected

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

end
