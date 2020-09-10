class AddNameToBookReport < ActiveRecord::Migration[5.2]
  def change
    add_column :book_reports, :title, :string
  end
end
