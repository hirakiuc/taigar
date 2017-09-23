module Taigar
  class Auth
    attr_accessor :type, :token

    def initialize(type, token)
      @type = type
      @token = token
    end
  end

  class Client
    attr_reader :auth

    def initialize(options)
      @options = options
      @auth = nil
    end

    def login(username, password)
      api = Taigar::Api::LoginApi.new
      api.login(username, password).tap do |result|
        @auth = Auth.new(:Bearer, result.attr(:auth_token))
      end
    end

    def project(params)
      api = Taigar::Api::ProjectsApi.new
      api.authorization(@auth)

      return api.get_by_id(params[:id]) if params[:id]
      return api.get_by_slug(params[:slug]) if params[:slug]
      throw ArgumentError.new('Require id or slug argument')
    end
  end
end
