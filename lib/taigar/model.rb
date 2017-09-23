module Taigar
  module Model
    extend ActiveSupport::Autoload

    %i[
      Base
      EpicStatus
      IssueStatus
      IssueType
      Member
      Milestone
      Point
      Priority
      Project
      Role
      Severity
      TaskStatus
      UserAuth
      UserStoryStatus
    ].each do |klass|
      autoload klass
    end
  end
end
