class CreateBookTable < ActiveRecord::Migration
  def change
    create_table :book do |t|
      t.string :title
      t.string :auther
      t.integer :release_year
      t.string :purchase_link
      t.integer :user_id
    end
  end
end
