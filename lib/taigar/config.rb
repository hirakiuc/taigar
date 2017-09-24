module Taigar
  class Config
    include ActiveSupport::Configurable
    config_accessor :logger, :token, :auth
  end
end
