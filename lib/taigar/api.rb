module Taigar
  module Api
    extend ActiveSupport::Autoload

    %i[
      BaseApi
      IssuesApi
      LoginApi
      ProjectsApi
    ].each do |klass|
      autoload klass
    end
  end
end
