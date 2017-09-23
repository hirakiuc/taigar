module Taigar
  module Model
    class Base < Hashie::Mash
      include Hashie::Extensions::MethodAccess
      include Hashie::Extensions::IndifferentAccess

      # include ::ActiveModel::Serializers::JSON
      # include Concerns::AcceptableAttributes
      # include Concerns::Enumerable

      protected

      def logger
        Taigar.logger
      end
    end
  end
end
