module Taigar
  module Resource
    class Issues < Base
      def initialize(project, options)
        @project = project
        @args = [options]
      end

      private

      def issues_api
        create_api('Issues')
      end

      def enumerator
        create_enumerator(issues_api, :list, *@args)
      end
    end
  end
end
