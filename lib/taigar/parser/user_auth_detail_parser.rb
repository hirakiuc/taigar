module Taigar
  module Parser
    class UserAuthDetailParser < BaseParser
      def convert(json)
        Taigar::Model::UserAuthDetail.new(json)
      end
    end
  end
end
