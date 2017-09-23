module Taigar
  module Api
    extend ActiveSupport::Autoload

    %i[
      BaseApi
      LoginApi
      ProjectsApi
    ].each do |klass|
      autoload klass
    end
  end
end
