module Taigar
  module Api
    extend ActiveSupport::Autoload

    %i[
      BaseApi
      LoginApi
    ].each do |klass|
      autoload klass
    end
  end
end
