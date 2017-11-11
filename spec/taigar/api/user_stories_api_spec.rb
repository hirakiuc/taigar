require 'spec_helper'

RSpec.describe Taigar::Api::UserStoriesApi do
  include ApiResponseMacros
  subject { Taigar::Api::UserStoriesApi.new }

  describe '#list' do
    before { stub_apiresponse(:get, '/api/v1/userstories') }
    it 'should return Page model' do
      expect(subject.list({})).to be_an_instance_of(Taigar::Model::Page)
    end
  end

  describe '#get_by_id' do
    before { stub_apiresponse(:get, '/api/v1/userstories/1') }
    it 'should return UserStory model' do
      expect(subject.get_by_id(1)).to be_an_instance_of(Taigar::Model::UserStory)
    end
  end
end
