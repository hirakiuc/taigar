require 'spec_helper'

RSpec.describe Taigar::Api::ProjectsApi do
  include ApiResponseMacros
  subject { Taigar::Api::ProjectsApi.new }

  describe '#get_by_id' do
    before { stub_apiresponse(:get, '/api/v1/projects/1') }
    it 'should return Project model' do
      expect(subject.get_by_id(1)).to be_an_instance_of(Taigar::Model::Project)
    end
  end

  describe '#get_by_slug' do
    before { stub_apiresponse(:get, '/api/v1/projects/by_slug?slug=project-0') }
    it 'should return Project model' do
      expect(subject.get_by_slug('project-0')).to be_an_instance_of(Taigar::Model::Project)
    end
  end
end
