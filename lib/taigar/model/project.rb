module Taigar
  module Model
    class Project < Base
      include Hashie::Extensions::Coercion

      coerce_key :severities, Array[Severity]
      coerce_key :members, Array[Member]
      coerce_key :points, Array[Point]
      coerce_key :issue_types, Array[IssueType]
      coerce_key :us_statuses, Array[UserStoryStatus]
      coerce_key :issue_statuses, Array[IssueStatus]
      coerce_key :task_statuses, Array[TaskStatus]
      coerce_key :milestones, Array[Milestone]
      coerce_key :roles, Array[Role]
      coerce_key :priorities, Array[Priority]
      coerce_key :epic_statuses, Array[EpicStatus]

      def issues(params = {})
        Taigar::Resource::Issues.new(self, params.merge(project: id))
      end

      private

      def issues_api
        @issues_api ||= Taigar::Api::IssuesApi.new
      end
    end
  end
end
