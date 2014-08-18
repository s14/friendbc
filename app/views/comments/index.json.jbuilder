json.array!(@comments) do |comment|
  json.extract! comment, :id, :facebook_id, :post_id_id, :friend_id_id, :message, :like_count
  json.url comment_url(comment, format: :json)
end
