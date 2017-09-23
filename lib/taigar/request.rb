module Taigar
  module Request
    protected

    def get_path(path, model_klass, params = {}, options = {})
      request(:get, path, model_klass, params, options)
    end

    def patch_path(path, model_klass, params = {}, options = {})
      request(:patch, path, model_klass, params, options)
    end

    def post_path(path, model_klass, params = {}, options = {})
      request(:post, path, model_klass, params, options)
    end

    def put_path(path, model_klass, params = {}, options = {})
      request(:put, path, model_klass, params, options)
    end

    def delete_path(path, model_klass, params = {}, options = {})
      request(:delete, path, model_klass, params, options)
    end

    private

    def request(method, path, model_klass, params, options)
      conn = connection(model_klass, options)
      configure_authorization(conn)

      response = conn.send(method) do |request|
        case method.intern
        when :get, :delete
          request.body = params.delete('data') if params.key?('data')
          request.url(adjust_path(conn, path), params)
        when :post, :put, :patch
          request.path = adjust_path(conn, path)
          request.body = extract_data_from_params(params) unless params.empty?
        else
          raise ArgumentError, 'unknown http method: ' + method
        end
      end

      response.body
    end

    def adjust_path(conn, path)
      return path if conn.path_prefix == '/'

      (conn.path_prefix + path).gsub(%r{//}, '/')
    end

    def configure_authorization(conn)
      return unless @auth

      conn.authorization(@auth.type, @auth.token)
    end

    def extract_data_from_params(params)
      if params.key?('data') && !params['data'].nil?
        params['data']
      else
        params
      end
    end
  end
end
