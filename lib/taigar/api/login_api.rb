module Taigar
  module Api
    class LoginApi < BaseApi
      def login(username, password)
        params = {
          type: 'normal',
          username: username,
          password: password
        }

        post_path(
          '/auth',
          params,
          Taigar::Parser::UserAuthParser
        )
      end
    end
  end
end
