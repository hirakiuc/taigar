module Taigar
  module Api
    class LoginApi < BaseApi
      def login(username, password)
        post_path(
          '/auth', {
            type: 'normal',
            username: username,
            password: password
          },
          Taigar::Parser::UserAuthDetailParser
        )
      end
    end
  end
end
