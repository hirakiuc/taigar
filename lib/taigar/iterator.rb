module Taigar
  class Iterator
    def initialize(api_client, method, *args)
      @client = api_client
      @method = method
      @args = args

      @attrs = {}
      @values = []
      @pos = nil
    end

    def next
      throw NotImplementedError
    end
  end
end
