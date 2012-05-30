module Exceptions
  class FailuresController < ApplicationController
    before_filter :github, :only => [:github_authorization, :github_callback]
    def index
      @failures = Failure.all
      render "failures/index"
    end

    # def github_callback
    #   k = []
    #   token = @client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri).token
    #   @github = Github.new oauth_token: token
    #   @github.repos.commits.all 'dipeshgtm','kurakani'
    #   # => [{"url"=>
    #   #    "https://api.github.com/repos/ryanza/stateflow/commits/0b3b9040a3a502572766d9cba641e1243cfd52b2",
    #   #   "committer"=>
    #   #    {"url"=>"https://api.github.com/users/ryanza",
    #   #     "login"=>"ryanza",
    #   #     "avatar_url"=>
    #   #      "https://secure.gravatar.com/avatar/9a6e3bbae388477fe9c39f9507acf5c7?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    #   #     "gravatar_id"=>"9a6e3bbae388477fe9c39f9507acf5c7",
    #   #     "id"=>100300},
    #   #   "sha"=>"0b3b9040a3a502572766d9cba641e1243cfd52b2",
    #   @github.git_data.trees.get 'dipeshgtm','kurakani', '77c657f6e9ecf410a93ea5a57b11cac39db07c00',recursive: true do |file|
    #     k << file
    #   end

      # {"url"=>
      #   "https://api.github.com/repos/dipeshgtm/kurakani/git/blobs/4dcb3779a2d5f2e5c15681b8b73be0348747f72d",
      #   "type"=>"blob",
      #   "size"=>4541,
      #   "sha"=>"4dcb3779a2d5f2e5c15681b8b73be0348747f72d",
      #   "path"=>"vendor/assets/javascripts/jquery_ujs.js",
      #   "mode"=>"100644"
      # }

    # end

    # def github_authorization
    #   binding.pry
    #   @auth_url = @client.auth_code.authorize_url(:redirect_uri => redirect_uri, :scope => 'user')
    #   redirect_to @auth_url
    # end
    # 
    # def redirect_uri(path = '/exceptions/githook', query = nil)
    #   uri = URI.parse(request.url)
    #   uri.path  = path
    #   uri.query = query
    #   uri.to_s
    # end
    # 
    # private
    # def github
    #   @client = Exceptions::Engine.git_client
    # end

  end
end