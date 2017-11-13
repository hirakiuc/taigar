require 'spec_helper'

RSpec.describe Taigar::Model::Epic::RelatedUserStory do
  include ApiResponseMacros

  subject { Taigar::Model::Epic::RelatedUserStory.new }

  it { expect(subject).to be_a_kind_of(Taigar::Model::Base) }

  describe '#target_user_story' do
    before { stub_apiresponse(:get, '/api/v1/userstories/1') }
    subject { Taigar::Model::Epic::RelatedUserStory.new(user_story: 1) }

    it 'should return a UserStory model' do
      expect(subject.target_user_story).to be_an_instance_of(Taigar::Model::UserStory)
    end
  end
end
