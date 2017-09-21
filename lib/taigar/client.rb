module Taigar
  class Auth
    attr_accessor :type, :token
  end

  class Client
    attr_reader :auth

    def initialize(options)
      @options = options
      @auth = Auth.new
    end

    def login(username, password)
      api = Taigar::Api::LoginApi.new
      api.login(username, password).tap do |result|
        @auth.type = :Bearer
        @auth.token = result.attr(:auth_token)
      end
    end
  end
end
