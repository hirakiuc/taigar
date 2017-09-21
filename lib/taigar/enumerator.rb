module Taigar
  class Enumerator < ::Enumerator
    def initialize(iterator, block)
      @iterator = iterator
      @block = block

      super() do |y|
        loop do
          v = @iterator.next
          m = @block ? @block.call(v) : v
          y.yield(m)
        end
      end

      lazy if lazy_enumerable?
    end

    def size
      @iterator.size
    end

    private

    def lazy_enumerable?
      ruby_major_version >= 2
    end

    def ruby_major_version
      RUBY_VERSION.split('.')[0].to_i
    end
  end
end
