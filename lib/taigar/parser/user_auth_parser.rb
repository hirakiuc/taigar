module Taigar
  module Parser
    class UserAuthParser < BaseParser
      def convert(json)
        Taigar::Model::UserAuth.new(json)
      end
    end
  end
end
