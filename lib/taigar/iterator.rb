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
      next_value
    end

    def size
      load_next if next?
      @attrs[:count]
    end

    private

    def next_value
      load_next if next?

      @values.fetch(@pos).tap { @pos += 1 }
    rescue IndexError
      raise StopIteration
    end

    def next?
      @pos.nil? || (@values.size == @pos && @attrs[:next_params])
    end

    def load_next
      @pos = 0 if @pos.nil?

      page = @client.send(@method, *next_params)
      @attrs = page.attrs
      @values.concat(page.items)
    end

    def next_params
      params =
        if (@attrs && @attrs[:next_params])
          @attrs[:next_params]
        else
          {}
        end

      @args[-1].merge!(params)
      @args
    end
  end
end
