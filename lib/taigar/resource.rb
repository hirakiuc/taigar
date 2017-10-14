module Taigar
  module Resource
    extend ActiveSupport::Autoload

    %i[
      Base
      Epics
      Issues
      UserStories
    ].each do |klass|
      autoload klass
    end
  end
end
