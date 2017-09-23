module Taigar
  class Client
    attr_reader :auth

    def initialize(options)
      @options = options
    end

    def login(username, password)
      api = Taigar::Api::LoginApi.new
      api.login(username, password).tap do |result|
        Taigar.config.auth = Taigar::Auth.new(:Bearer, result.auth_token)
      end
    end

    def project(params)
      api = Taigar::Api::ProjectsApi.new

      return api.get_by_id(params[:id]) if params[:id]
      return api.get_by_slug(params[:slug]) if params[:slug]
      throw ArgumentError.new('Require id or slug argument')
    end
  end
end
