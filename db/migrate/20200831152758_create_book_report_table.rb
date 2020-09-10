class CreateBookReportTable < ActiveRecord::Migration[5.2]
  def change
    create_table :book_reports do |t|
      t.string :synopsis
      t.string :rating
      t.integer :user_id
      t.integer :book_id
    end
  end
end
