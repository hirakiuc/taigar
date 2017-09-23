require 'taigar/version'

require 'active_support/dependencies/autoload'

require 'active_support/configurable'
require 'active_support/inflector'

require 'hashie'

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/response_middleware'

require 'taigar/config'
require 'taigar/null_logger'
require 'taigar/api'
# require 'taigar/api_factory'
# require 'taigar/api/helper'
require 'taigar/connection'
# require 'taigar/constants'
require 'taigar/error'
# require 'taigar/model/concerns'
require 'taigar/model'
require 'taigar/request'
# require 'taigar/resource'
require 'taigar/response'

require 'taigar/client'

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
