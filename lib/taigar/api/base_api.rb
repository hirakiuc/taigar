module Taigar
  module Api
    class BaseApi
      include Taigar::Connection
      include Taigar::Request

      def initialize
        @auth = nil
      end

      def authorization(auth)
        @auth = auth
      end

      private

      def loggar
        Taigar.logger
      end
    end
  end
end
