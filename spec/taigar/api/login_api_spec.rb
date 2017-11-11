require 'spec_helper'

RSpec.describe Taigar::Api::LoginApi do
  include ApiResponseMacros
  subject { Taigar::Api::LoginApi.new }

  describe '#login' do
    before { stub_apiresponse(:post, '/api/v1/auth') }
    it 'should return UserAuth model' do
      expect(subject.login('hoge', 'huga')).to be_an_instance_of(Taigar::Model::UserAuth)
    end
  end
end
