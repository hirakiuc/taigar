module Taigar
  module Parser
    extend ActiveSupport::Autoload

    %i[
      BaseParser
      UserAuthDetailParser
    ].each do |klass|
      autoload klass
    end
  end
end
