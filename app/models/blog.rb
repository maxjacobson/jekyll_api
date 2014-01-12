class Blog < ActiveRecord::Base
  validates_presence_of :repo, :email
  after_create :generate_auth_token

  def create_post(post_text)
    repo = self.clone_or_pull
  end

  def path_to_repo
    Rails.root.join("tmp", auth_token).to_s
  end

  def already_cloned?
    Dir.exists? path_to_repo
  end

  def clone_or_pull
    if already_cloned?
      repo = Git.open path_to_repo
      repo.pull
    else
      repo = Git.clone repo, path_to_repo
    end
    repo
  end

  private
    def generate_auth_token
      while self.auth_token.nil?
        self.auth_token = SecureRandom.hex
        self.save if Blog.where(auth_token: self.auth_token).empty?
      end
    end
end
