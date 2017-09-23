module Taigar
  class ApiFactory
    class << self
      def create_instance(klass_name)
        klass =
          begin
            name = "#{klass_name}Api".intern
            Taigar::Api.const_get name
          rescue NameError => e
            Taigar.logger.error e
            raise ArgumentError, 'must provide klass to be instantiated'
          end

        klass.new
      end
    end
  end
end
