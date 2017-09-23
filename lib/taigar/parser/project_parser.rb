module Taigar
  module Parser
    class ProjectParser < BaseParser
      def convert(json)
        Taigar::Model::Project.new(json)
      end
    end
  end
end
