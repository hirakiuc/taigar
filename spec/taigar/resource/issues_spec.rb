require 'spec_helper'

RSpec.describe Taigar::Resource::Issues do
  include ApiResponseMacros

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

  describe 'enumerable' do
    before { stub_apiresponse(:get, '/api/v1/issues') }
    let(:project) { Taigar::Model::Project.new(id: 1) }
    subject { Taigar::Resource::Issues.new(project, {}) }

    describe '#first' do
      it 'should return a Issue model' do
        expect(subject.first).to be_an_instance_of(Taigar::Model::Issue)
      end
    end
  end
end
