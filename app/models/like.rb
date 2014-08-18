class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :friend

  validates :post, :presence => true, :uniqueness => { :scope => :friend }
  validates :friend, :presence => true
end
