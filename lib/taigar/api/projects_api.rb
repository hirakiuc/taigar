module Taigar
  module Api
    class ProjectsApi < BaseApi
      def get_by_id(project_id)
        get_path(
          "/projects/#{project_id}",
          Taigar::Model::Project,
          {}
        )
      end

      def get_by_slug(slug)
        get_path(
          '/projects/by_slug',
          Taigar::Model::Project,
          slug: slug
        )
      end
    end
  end
end
