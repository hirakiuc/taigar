module Taigar
  module Resource
    class Base
      protected

      def method_missing(method, *args)
        enum = enumerator

        return super unless enum.respond_to?(method)

        enum.send(method, *args) do |m|
          block_given? ? yield(m) : m
        end
      end

      def respond_to_missing?(symbol, include_all)
        enumerator.respond_to?(symbol, include_all)
      end

      def create_enumerator(api_client, method, *args, &block)
        iter = Taigar::Iterator.new(api_client, method, *args)
        Taigar::Enumerator.new(iter, block)
      end

      def create_api(name)
        ApiFactory.create_instance(*name.split('::'))
      end
    end
  end
end
