require 'spec_helper'

RSpec.describe Taigar::Resource::UserStories do
  include ApiResponseMacros

  let(:project) { Taigar::Model::Project.new }
  let(:opts) { {key: 'value'} }

  subject(:instance) { Taigar::Resource::UserStories.new(project, opts) }

  it { expect(instance).to be_a_kind_of(Taigar::Resource::Base) }

  describe '#new' do
    it 'should return an instance' do
      expect(instance).to has_instance_variable(:@project, project)
      expect(instance).to has_instance_variable(:@args, [opts])
    end
  end

  describe 'enumerable' do
    before { stub_apiresponse(:get, '/api/v1/userstories') }
    let(:project) { Taigar::Model::Project.new(id: 1) }
    subject { Taigar::Resource::UserStories.new(project, {}) }

    describe '#first' do
      it 'should return a UserStory model' do
        expect(subject.first).to be_an_instance_of(Taigar::Model::UserStory)
      end
    end
  end
end
