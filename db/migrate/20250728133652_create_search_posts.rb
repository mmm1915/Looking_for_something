class CreateSearchPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :search_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_name
      t.string :search_place
      t.integer :status
      t.string :found_place

      t.timestamps
    end
  end
end
