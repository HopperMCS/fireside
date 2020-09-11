class User < ActiveRecord::Base
  has_secure_password
  has_many :books
  has_many :book_reports

  validates :username, presence: true, uniqueness: true
end