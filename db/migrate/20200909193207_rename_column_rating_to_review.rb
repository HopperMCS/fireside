class RenameColumnRatingToReview < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_reports, :rating, :review
  end
end
