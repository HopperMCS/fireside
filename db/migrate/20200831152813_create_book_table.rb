class CreateBookTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :release_year
      t.string :purchase_link
      t.integer :user_id
    end
  end
end
