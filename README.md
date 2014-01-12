Demo: <https://vimeo.com/83994673>

# jekyll api

I wish I had an API for updating my Jekyll blog, hosted on GitHub pages.

The blog is hosted at <http://maxjacobson.github.io> / <http://www.hardscrabble.net/>.

I don't *mind* using Git to update it, but it would be cool if I didn't have to.

I know GitHub has created a RubyGem, called Git, that makes it easy-ish to interact with a Git repo in Ruby.

Here's the vision:

* A web service I can sign up for
* I tell it the address of my git repo on Github, eg <git@github.com:maxjacobson/maxjacobson.github.io.git>
* I add <http://github.com/jekyll_api> (or whatever, haven't created it), a new bot github account, as a GitHub Collaborator on that repo, so it can push to the repo
* it gives me a unique endpoint, eg <http://jekyllapi.com/publish/1234?auth_token_4567>
* I can send HTTP POST requests to that endpoint with the data of a new blog post
* The API will receive your request, pull the latest version of your blog, create a new file, commit that file, and push the changes
* If I ever decide I want to revoke access, I can remove that bot as a collaborator or delete my account on the service

Maybe there could be a web interface for creating these files as well, why not?

