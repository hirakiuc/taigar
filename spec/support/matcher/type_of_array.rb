require 'rspec/expectations'

RSpec::Matchers.define :be_an_array_of do |expected|
  match do |actual|
    return false unless actual.kind_of?(Array)

    actual.all? { |v| v.kind_of?(expected) }
  end

  failure_message_when_negated do |actual|
    "expected that #{actual}, would not be an Array of #{expected}"
  end
end
