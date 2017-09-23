module Taigar
  module Model
    extend ActiveSupport::Autoload

    %i[
      Base
      UserAuthDetail
      ProjectDetail
    ].each do |klass|
      autoload klass
    end
  end
end
