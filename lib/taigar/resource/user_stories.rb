module Taigar
  module Resource
    class UserStories < Base
      def initialize(project, options)
        @project = project
        @args = [options]
      end

      private

      def user_stories_api
        create_api('UserStories')
      end

      def enumerator
        create_enumerator(user_stories_api, :list, *@args)
      end
    end
  end
end
