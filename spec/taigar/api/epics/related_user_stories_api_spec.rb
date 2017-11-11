require 'spec_helper'

RSpec.describe Taigar::Api::Epics::RelatedUserStoriesApi do
  include ApiResponseMacros
  subject do
    Taigar::Api::Epics::RelatedUserStoriesApi.new.tap do |m|
      m.epic = Taigar::Model::Epic.new(id: 17)
    end
  end

  describe '#list' do
    before { stub_apiresponse(:get, '/api/v1/epics/17/related_userstories') }
    it 'should return Page model' do
      expect(subject.list({})).to be_an_instance_of(Taigar::Model::Page)
    end
  end
end
