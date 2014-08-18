class Post < ActiveRecord::Base
  belongs_to :friend
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :facebook_id, :presence => true, :uniqueness => true
  validates :friend, :presence => true
  validates :link, :presence => true
end
