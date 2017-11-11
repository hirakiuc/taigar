require 'spec_helper'

RSpec.describe Taigar::Api::EpicsApi do
  include ApiResponseMacros
  subject { Taigar::Api::EpicsApi.new }

  describe '#list' do
    before { stub_apiresponse(:get, '/api/v1/epics') }
    it 'should return Page model' do
      expect(subject.list({})).to be_an_instance_of(Taigar::Model::Page)
    end
  end
end
