module Taigar
  class ApiFactory
    class << self
      def create_instance(*args)
        klass_name = args.pop

        ns =
          if !args.size.empty?
            resolve_namespace(::Taigar::Api, args)
          else
            ::Taigar::Api
          end

        klass =
          begin
            name = "#{klass_name}Api".intern
            ns.const_get name
          rescue NameError => e
            Taigar.logger.error e
            raise ArgumentError, 'must provide klass to be instantiated'
          end

        klass.new
      end

      def resolve_namespace(current, args)
        return current if args.empty?

        ns = current.const_get args.shift
        args.empty? ? resolve_namespace(ns, args) : ns
      end
    end
  end
end
