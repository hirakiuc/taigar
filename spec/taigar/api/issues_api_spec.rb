require 'spec_helper'

RSpec.describe Taigar::Api::IssuesApi do
  include ApiResponseMacros
  subject { Taigar::Api::IssuesApi.new }

  describe '#list' do
    before { stub_apiresponse(:get, '/api/v1/issues') }
    it 'should return Page model' do
      expect(subject.list({})).to be_an_instance_of(Taigar::Model::Page)
    end
  end
end
