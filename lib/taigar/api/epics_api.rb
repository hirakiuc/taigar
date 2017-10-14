module Taigar
  module Api
    class EpicsApi < BaseApi
      def list(params)
        get_path(
          '/epics',
          Taigar::Model::Epic,
          params
        )
      end
    end
  end
end
