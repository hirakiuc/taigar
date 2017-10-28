require 'rspec/expectations'

RSpec::Matchers.define :has_instance_variable do |key, expected|
  match do |actual|
    v = actual.instance_variable_get(key)
    case expected
    when Array; v.sort == expected.sort
    else      ; v.equal?(expected)
    end
  end

  failure_message_when_negated do |actual|
    "expected that #{actual}, would not have an instance variable #{expected} at key:#{key}"
  end
end
