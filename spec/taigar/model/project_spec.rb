require 'spec_helper'

RSpec.describe Taigar::Model::Project do
  it { expect(subject).to be_a_kind_of(Taigar::Model::Base) }

  subject(:instance) do
    json = Fixture.load('project')
    Taigar::Model::Project.new(json)
  end

  describe '#severities' do
    it 'should return array of Severity' do
      expect(instance.severities).to \
        be_an_array_of(Taigar::Model::Severity)
    end
  end

  describe '#members' do
    it 'should return array of Member' do
      expect(instance.members).to \
        be_an_array_of(Taigar::Model::Member)
    end
  end

  describe '#points' do
    it 'should return array of Point' do
      expect(instance.points).to \
        be_an_array_of(Taigar::Model::Point)
    end
  end

  describe '#issue_types' do
    it 'should return array of IssueType' do
      expect(instance.issue_types).to \
        be_an_array_of(Taigar::Model::IssueType)
    end
  end

  describe '#us_statuses' do
    it 'should return array of UserStoryStatus' do
      expect(instance.us_statuses).to \
        be_an_array_of(Taigar::Model::UserStoryStatus)
    end
  end

  describe '#issue_statuses' do
    it 'should return array of IssueStatus' do
      expect(instance.issue_statuses).to \
        be_an_array_of(Taigar::Model::IssueStatus)
    end
  end

  describe '#task_statuses' do
    it 'should return array of TaskStatus' do
      expect(instance.task_statuses).to \
        be_an_array_of(Taigar::Model::TaskStatus)
    end
  end

  describe '#milestones' do
    it 'should return array of Milestone' do
      expect(instance.milestones).to \
        be_an_array_of(Taigar::Model::Milestone)
    end
  end

  describe '#roles' do
    it 'should return array of Role' do
      expect(instance.roles).to \
        be_an_array_of(Taigar::Model::Role)
    end
  end

  describe '#priorities' do
    it 'should return array of Priority' do
      expect(instance.priorities).to \
        be_an_array_of(Taigar::Model::Priority)
    end
  end

  describe '#epic_statuses' do
    it 'should return array of EpicStatus' do
      expect(instance.epic_statuses).to \
        be_an_array_of(Taigar::Model::EpicStatus)
    end
  end

  describe '#issues' do
    it 'should return issues resource' do
      expect(instance.issues).to \
        be_an_instance_of(Taigar::Resource::Issues)
    end
  end

  describe '#user_stories' do
    it 'should return user_stories resource' do
      expect(instance.user_stories).to \
        be_an_instance_of(Taigar::Resource::UserStories)
    end
  end

  describe '#epics' do
    it 'should return epics resource' do
      expect(instance.epics).to \
        be_an_instance_of(Taigar::Resource::Epics)
    end
  end
end
