class Company < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password,:password_confirmation,:organisation, :organisation_type, :password_digest
  has_secure_password
end
