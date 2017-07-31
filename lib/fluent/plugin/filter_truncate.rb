# frozen_string_literal: true

module Fluent
  module Plugin
    class TruncateFilter < Filter
      Fluent::Plugin.register_filter('truncate', self)

      def filter(_tag, _time, record)
        record
      end
    end
  end
end
