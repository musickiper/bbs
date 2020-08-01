class User < ApplicationRecord
  has_secure_password

  validates :email, email: true, presence: true,
            uniqueness: {case_sensitive: false}
  validates :username, presence: true,
            uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 10, allow_blank: true}

end
