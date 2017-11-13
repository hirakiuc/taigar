require 'spec_helper'

RSpec.describe Taigar::Resource::Epics::RelatedUserStories do
  include ApiResponseMacros

  let (:epic) { Taigar::Model::Epic.new }
  let(:opts) { {key: 'value'} }

  subject { Taigar::Resource::Epics::RelatedUserStories.new(epic, opts) }

  it { expect(subject).to be_a_kind_of(Taigar::Resource::Base) }

  describe 'new' do
    it 'should return an instance' do
      expect(subject).to has_instance_variable(:@epic, epic)
      expect(subject).to has_instance_variable(:@args, [opts])
    end
  end

  describe 'enumerable' do
    before { stub_apiresponse(:get, '/api/v1/epics/17/related_userstories') }
    let(:epic) { Taigar::Model::Epic.new(id: 17) }
    subject { Taigar::Resource::Epics::RelatedUserStories.new(epic, {}) }

    describe '#first' do
      it 'should return a RelatedUserStories model' do
        expect(subject.first).to be_an_instance_of(Taigar::Model::Epic::RelatedUserStory)
      end
    end
  end
end
