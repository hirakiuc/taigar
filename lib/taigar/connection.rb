module Taigar
  module Connection
    DEFAULT_USER_AGENT = 'taigar, taiga.io REST API client'.freeze

    #
    # @params [Hash] options the options to create a connection.
    # @option options [Hash] headers request headers hash
    # @params [Taigar::Parser::BaseParser] parser response parser class.
    # @return [Faraday] a Faraday instance.
    def connection(options = {}, parser = nil)
      conn_options = default_options(options)

      Faraday.new(
        conn_options.merge(builder: stack(parser))
      )
    end

    private

    def default_options(options)
      {
        headers: {
          USER_AGENT: DEFAULT_USER_AGENT
        },
        ssl: { verify: false },
        url: 'https://api.taiga.io/api/v1'
      }.merge(options)
    end

    def default_middleware(conn)
      conn.request :multipart
      conn.request :url_encoded

      conn.response :json, content_type: /\bjson$/
      conn.use Taigar::Response::Handler
      conn.use :instrumentation

      conn.adapter Faraday.default_adapter
    end

    def stack(parser)
      Faraday::RackBuilder.new do |conn|
        conn.use parser if parser.present?
        default_middleware(conn)
      end
    end
  end
end
