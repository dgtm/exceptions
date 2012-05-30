module Exceptions
  class Engine < Rails::Engine
    isolate_namespace Exceptions

    def self.client_id
      "66ad998285939cb1ed1b"
    end

    def self.client_secret
      "7248ed920805deca1aa7371ebe39f25fa21f0aef"
    end

    def self.git_client
      client = OAuth2::Client.new(client_id, client_secret,
      :site => 'https://api.github.com',
      :authorize_url => 'https://github.com/login/oauth/authorize',
      :token_url => 'https://github.com/login/oauth/access_token')
      # token = client.auth_code.get_token('1993d0c216284078172c',:redirect_uri => "http://office.sprout-technology.com:85")
    end

  end
end
