module Taigar
  module Resource
    extend ActiveSupport::Autoload

    %i[
      Base
      Issues
      UserStories
    ].each do |klass|
      autoload klass
    end
  end
end
