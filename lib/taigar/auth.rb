module Taigar
  class Auth
    attr_accessor :type, :token

    def initialize(type, token)
      @type = type
      @token = token
    end
  end
end
