class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :friend

  validates :facebook_id, :presence => true, :uniqueness => true
  validates :post, :presence => true
  validates :friend, :presence => true
  validates :message, :presence => true
end
