require 'open-uri'

the_user = User.first

url = "https://graph.facebook.com/v2.1/me/home?limit=200&access_token=#{the_user.facebook_access_token}"

raw_data = open(url).read
parsed_data = JSON.parse(raw_data)
post_hashes = parsed_data["data"]

# puts post_hashes.to_yaml

post_hashes.each do |post_hash|
  if post_hash["type"] == "video"
    the_post = Post.find_or_create_by :facebook_id => post_hash["id"]
    the_post.message = post_hash["message"]
    if post_hash["link"].present?
      the_post.link = post_hash["link"]
    else
      the_post.link = post_hash["source"]
    end
    the_post.name = post_hash["name"]
    the_post.description = post_hash["description"]
    the_post.picture = post_hash["picture"]
    the_post.fb_created_time = post_hash["created_time"]
    the_post.user = the_user

    # the_friend = Friend.find_by :facebook_id => post_hash["from"]["id"]
    # if the_friend.blank?
    #   the_friend = Friend.new
    #   the_friend.facebook_id = post_hash["from"]["id"]
    # end

    the_friend = Friend.find_or_create_by :facebook_id => post_hash["from"]["id"]
    the_friend.name = post_hash["from"]["name"]
    the_friend.save
    the_post.friend = the_friend

    the_post.save

    if post_hash["comments"].present?
      # some stuff to save comments
    end

    if post_hash["likes"].present?
      post_hash["likes"]["data"].each do |like_hash|
        the_like = Like.new
        the_like.post = the_post

        the_friend = Friend.find_or_create_by :facebook_id => like_hash["id"]
        the_friend.name = like_hash["name"]
        the_friend.save
        the_like.friend = the_friend

        the_like.save
        if the_like.post_id == nil
          puts the_post.inspect
          puts the_like.inspect
          puts like_hash.inspect
        end
      end
    end

  end
end

# Go through each post
#   If the post is a video
#     If we don't already have that post saved
#        Save the post
#        Save any comments (if we don't have them already)
#        Save any likes (if we don't have them already)
