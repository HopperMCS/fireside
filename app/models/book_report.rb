class BookReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  
  validates :title, presence: true
  validates :synopsis, presence: true
  validates :review, presence: true
end