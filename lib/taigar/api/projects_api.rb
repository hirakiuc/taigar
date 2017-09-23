module Taigar
  module Api
    class ProjectsApi < BaseApi
      def get_by_id(project_id)
        get_path(
          "/projects/#{project_id}",
          {},
          Taigar::Parser::ProjectDetailParser
        )
      end

      def get_by_slug(slug)
        get_path(
          '/projects/by_slug',
          { slug: slug },
          Taigar::Parser::ProjectDetailParser
        )
      end
    end
  end
end
