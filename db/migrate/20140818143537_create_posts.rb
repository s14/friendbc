class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :facebook_id
      t.belongs_to :friend_id, index: true
      t.text :message
      t.string :link
      t.string :name
      t.text :description
      t.string :picture
      t.datetime :fb_created_time

      t.timestamps
    end
  end
end
