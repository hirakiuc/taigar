require 'spec_helper'

RSpec.describe Taigar::Model::Base do
  it { expect(subject).to be_a_kind_of(Taigar::Model::Base) }
end
