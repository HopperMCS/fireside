class CreateBookReportTable < ActiveRecord::Migration
  def change
    create_table :book_reports do |t|
      t.string :book
      t.string :user
      t.string :synopsis
      t.string :rating
    end
  end
end
