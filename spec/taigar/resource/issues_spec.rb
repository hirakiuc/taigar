require 'spec_helper'

RSpec.describe Taigar::Resource::Issues do
  let(:project) { Taigar::Model::Project.new }
  let(:opts) { {key: 'value'} }

  subject(:instance) { Taigar::Resource::Issues.new(project, opts) }

  it { expect(instance).to be_a_kind_of(Taigar::Resource::Base) }

  describe 'new' do
    it 'should return an instance' do
      expect(instance).to has_instance_variable(:@project, project)
      expect(instance).to has_instance_variable(:@args, [opts])
    end
  end
end
