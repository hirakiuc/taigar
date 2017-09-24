module Taigar
  module Api
    class BaseApi
      include Taigar::Connection
      include Taigar::Request

      private

      def loggar
        Taigar.logger
      end
    end
  end
end
