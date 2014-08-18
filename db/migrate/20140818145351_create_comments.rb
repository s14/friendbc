class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :facebook_id
      t.belongs_to :post, index: true
      t.belongs_to :friend, index: true
      t.text :message
      t.integer :like_count, :default => 0

      t.timestamps
    end
  end
end
