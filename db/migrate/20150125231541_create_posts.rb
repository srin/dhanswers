class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :category
      t.string :disability

      t.timestamps null: false
    end
  end
end
