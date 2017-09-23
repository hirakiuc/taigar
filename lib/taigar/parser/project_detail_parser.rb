module Taigar
  module Parser
    class ProjectDetailParser < BaseParser
      def convert(json)
        Taigar::Model::ProjectDetail.new(json)
      end
    end
  end
end
