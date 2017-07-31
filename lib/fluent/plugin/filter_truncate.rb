# frozen_string_literal: true

require 'fluent/filter'

module Fluent
  module Plugin
    class TruncateFilter < Filter
      Fluent::Plugin.register_filter('truncate', self)

      config_param :string, :integer, default: nil

      def filter(tag, time, record)
        truncate(record)
      rescue => e
        router.emit_error_event(tag, time, record, e)
      end

      private

      def truncate(v)
        case v
        when Hash
          truncate_hash(v)
        when Array
          truncate_array(v)
        when String
          truncate_string(v)
        else
          v
        end
      end

      def truncate_hash(h)
        h.map do |k, v|
          [k, truncate(v)]
        end.to_h
      end

      def truncate_array(a)
        a.map do |v|
          truncate(v)
        end
      end

      def truncate_string(s)
        if @string
          s[0, @string]
        else
          s
        end
      end
    end
  end
end
