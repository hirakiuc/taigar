module Taigar
  module Api
    module Epics
      class RelatedUserStoriesApi < ::Taigar::Api::BaseApi
        attr_accessor :epic

        def list(params)
          get_path(
            "/epics/#{epic.id}/related_userstories",
            Taigar::Model::Epic::RelatedUserStory,
            params
          )
        end
      end
    end
  end
end
