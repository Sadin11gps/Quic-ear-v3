class User < ActiveRecord::Base
  attr_accessible :available, :experience, :mob_num, :name, :password, :password_digest, :preferred_jobs, :preferred_location, :ratings, :user_type, :password_confirmation, :password_confirmation
  has_secure_password
end
