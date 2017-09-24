module Taigar
  module Response
    class Wrapper < Faraday::Response::Middleware
      def on_complete(env)
        value = env[:body]
        return unless value.is_a?(Array)

        env[:body] = Taigar::Model::Page.new(value, env)
      end
    end
  end
end
