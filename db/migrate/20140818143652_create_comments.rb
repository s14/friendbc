class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :facebook_id
      t.belongs_to :post_id, index: true
      t.belongs_to :friend_id, index: true
      t.text :message
      t.integer :like_count

      t.timestamps
    end
  end
end
