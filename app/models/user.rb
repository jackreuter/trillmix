class User < ActiveRecord::Base
	validates :password, length: { minimum: 6 }
end
