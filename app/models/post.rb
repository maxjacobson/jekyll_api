class Post
  attr_accessor :slug, :text
  def initialize(post)
    @slug = post[:slug]
    @text = post[:text]
  end
end
