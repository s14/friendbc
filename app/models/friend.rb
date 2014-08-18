class Friend < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes

  validates :facebook_id, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
