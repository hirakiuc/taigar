module Taigar
  module Model
    module Concern
      module Enumerable
        extend ActiveSupport::Concern

        included do
          protected

          def enumerator(api_client, method, *args, &block)
            iter = Taigar::Iterator.new(api_client, method, *args)
            Taigar::Enumerator.new(iter, block)
          end
        end
      end
    end
  end
end
