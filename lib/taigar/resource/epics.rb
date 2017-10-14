module Taigar
  module Resource
    class Epics < Base
      def initialize(project, options)
        @project = project
        @args = [options]
      end

      private

      def epics_api
        create_api('Epics')
      end

      def enumerator
        create_enumerator(epics_api, :list, *@args)
      end
    end
  end
end
