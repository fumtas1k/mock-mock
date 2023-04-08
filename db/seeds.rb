Post.find_or_create_by(title: "test") do |post|
  post.name = "name"
end
