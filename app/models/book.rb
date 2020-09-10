class Book < ActiveRecord::Base
  has_many :book_reports
  belongs_to :user
end