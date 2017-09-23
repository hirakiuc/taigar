module Taigar
  module Parser
    extend ActiveSupport::Autoload

    %i[
      BaseParser
      UserAuthParser
      ProjectParser
    ].each do |klass|
      autoload klass
    end
  end
end
