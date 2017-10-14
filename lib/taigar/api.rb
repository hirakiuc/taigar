module Taigar
  module Api
    extend ActiveSupport::Autoload

    %i[
      BaseApi
      EpicsApi
      IssuesApi
      LoginApi
      ProjectsApi
      UserStoriesApi
    ].each do |klass|
      autoload klass
    end
  end
end
