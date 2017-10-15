module Taigar
  module Api
    class UserStoriesApi < BaseApi
      def list(params)
        get_path(
          '/userstories',
          Taigar::Model::UserStory,
          params
        )
      end

      def get_by_id(id, params)
        get_path(
          "/userstories/#{id}",
          Taigar::Model::UserStory,
          params
        )
      end
    end
  end
end
