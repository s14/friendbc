class Comment < ActiveRecord::Base
  belongs_to :post_id
  belongs_to :friend_id
end
