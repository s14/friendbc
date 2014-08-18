json.array!(@posts) do |post|
  json.extract! post, :id, :facebook_id, :friend_id_id, :message, :link, :name, :description, :picture, :fb_created_time
  json.url post_url(post, format: :json)
end
