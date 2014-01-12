class Blog < ActiveRecord::Base
  validates_presence_of :repo, :email
  after_create :generate_auth_token

  def create_post(post)
    repo = clone_repo()
    File.open("#{path_to_repo}/_posts/#{Date.today.iso8601}-#{post.slug}.md", "w") do |f|
      f.write post.text
    end
    #repo.config('user.name', 'Jekyll API bot')
    #repo.config('user.email', 'jekyllapibot@hardscrabble.net')
    repo.add
    repo.commit "added #{post.slug} post"
    repo.push
    post
  end

  def path_to_repo
    Rails.root.join("tmp", auth_token).to_s
  end

  def already_cloned?
    Dir.exists? path_to_repo
  end

  def clone_repo
    remove_repo if already_cloned?
    Git.clone repo, path_to_repo
  end

  private

    def remove_repo
      FileUtils.rm_rf path_to_repo
    end

    def generate_auth_token
      while self.auth_token.nil?
        self.auth_token = SecureRandom.hex
        self.save if Blog.where(auth_token: self.auth_token).empty?
      end
    end
end
