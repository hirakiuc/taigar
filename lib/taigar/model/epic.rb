module Taigar
  module Model
    class Epic < Base
      extend ActiveSupport::Autoload

      %i[
        RelatedUserStory
      ].each do |kls|
        autoload kls
      end

      def user_stories(params = {})
        Taigar::Resource::Epics::RelatedUserStories.new(self, params)
      end
    end
  end
end
