module Taigar
  module Model
    class Page
      attr_reader :items, :attrs

      def initialize(items, env)
        @items = items
        @attrs = parse_response_headers(env[:response_headers])
      end

      private

      def parse_response_headers(headers)
        {
          paginated: (headers['x-paginated'] == 'true'),
          per_page: (headers['x-paginated-by']).to_i,
          count: (headers['x-pagination-count']).to_i,
          current_page: (headers['x-pagination-current']).to_i,
          next_params: parse_query_params(headers['x-pagination-next']),
          prev_params: parse_query_params(headers['x-pagination-prev'])
        }
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
