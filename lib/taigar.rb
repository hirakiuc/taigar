require 'taigar/version'

require 'active_support/dependencies/autoload'

require 'active_support/configurable'
require 'active_support/inflector'

require 'hashie'

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/response_middleware'

require 'taigar/iterator'
require 'taigar/enumerator'

require 'taigar/auth'
require 'taigar/config'
require 'taigar/null_logger'
require 'taigar/api'
require 'taigar/api_factory'
require 'taigar/connection'
# require 'taigar/constants'
require 'taigar/error'
# require 'taigar/model/concerns'
require 'taigar/model'
require 'taigar/request'
require 'taigar/resource'
require 'taigar/response'

require 'taigar/client'

require 'active_support/notifications'
ActiveSupport::Notifications.subscribe('request.faraday') \
  do |_name, start_time, end_time, _, env|
    url = env[:url]
    http_method = env[:method].to_s.upcase
    duration = end_time - start_time
    Taigar.logger.debug \
      format(
        '[%s] %s %s (%.3f s)',
        url.host, http_method, url.request_uri, duration
      )
  end

module Taigar
  class << self
    include ActiveSupport::Configurable

    def new(options = {})
      Taigar::Client.new(options)
    end

    def configure
      yield(config)
    end

    def config
      @config ||= Taigar::Config.new
    end

    def logger
      config.logger || Taigar::NullLogger.new
    end
  end
end
