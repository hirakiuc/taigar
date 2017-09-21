module Taigar
  module Model
    extend ActiveSupport::Autoload

    %i[
      Base
      UserAuthDetail
    ].each do |klass|
      autoload klass
    end
  end
end
