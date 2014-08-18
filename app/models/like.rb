class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :friend
end
