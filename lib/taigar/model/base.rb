module Taigar
  module Model
    class Base
      # include ::ActiveModel::Serializers::JSON
      # include Concerns::AcceptableAttributes
      # include Concerns::Enumerable

      attr_reader :attrs

      def initialize(json)
        @attrs = json.map { |k, v| [k.intern, v] }.to_h
        @_loaded = @attrs.empty?
      end

      def attr(key)
        attrs[key.intern]
      end

      def attr?(key)
        attrs.key?(key.intern)
      end

      protected

      def logger
        Taigar.logger
      end
    end
  end
end
