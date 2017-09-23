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
        ApiFactory.create_instance(name)
      end

      private

      def parse_response_headers(headers)
        @pagenated = (headers['x-paginated'] == 'true')

        @per_page = (headers['x-paginated-by']).to_i
        @count = (headers['x-pagination-count']).to_i
        @current_page = (headers['x-pagination-current']).to_i

        @next_params = parse_query_params(headers['x-pagination-next'])
        @prev_params = parse_query_params(headers['x-pagination-prev'])
      end

      def parse_query_params(url)
        return nil if url.nil?

        uri = URI.parse(url)
        URI.decode_www_form(uri.query).map do |ary|
          [ary[0].intern, ary[1]]
        end.to_h
      end
    end
  end
end
