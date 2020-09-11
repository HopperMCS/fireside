class Book < ActiveRecord::Base
  has_many :book_reports
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :release_year, presence: true
  validates :purchase_link, presence: true
end