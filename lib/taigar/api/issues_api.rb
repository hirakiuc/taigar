module Taigar
  module Api
    class IssuesApi < BaseApi
      def list(params)
        get_path(
          '/issues',
          Taigar::Model::Issue,
          params
        )
      end
    end
  end
end
