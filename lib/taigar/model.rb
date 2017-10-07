module Taigar
  module Model
    extend ActiveSupport::Autoload

    %i[
      Base
      EpicStatus
      Issue
      IssueStatus
      IssueType
      Member
      Milestone
      Page
      Point
      Priority
      Project
      Role
      Severity
      TaskStatus
      UserAuth
      UserStory
      UserStoryStatus
    ].each do |klass|
      autoload klass
    end
  end
end
