module Taigar
  module Resource
    class Epics
      class RelatedUserStories < ::Taigar::Resource::Base
        def initialize(epic, options)
          @epic = epic
          @args = [options]
        end

        private

        def related_user_stories_api
          create_api('Epics::RelatedUserStories').tap do |api|
            api.epic = @epic
          end
        end

        def enumerator
          create_enumerator(related_user_stories_api, :list, *@args)
        end
      end
    end
  end
end
