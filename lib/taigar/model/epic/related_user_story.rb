module Taigar
  module Model
    class Epic
      class RelatedUserStory < ::Taigar::Model::Base
        def target_user_story
          @target_user_story ||= user_stories_api.get_by_id(user_story)
        end

        private

        def user_stories_api
          Taigar::Api::UserStoriesApi.new
        end
      end
    end
  end
end
