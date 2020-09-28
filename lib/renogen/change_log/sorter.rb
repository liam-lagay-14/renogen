module Renogen
  module ChangeLog
    class Sorter
      def initialize(changelog, sort_order, table_formatter)
        @changelog = changelog
        @sort_order = sort_order
        @table_formatter = table_formatter
      end

      def sort_changelog
        if table_formatter
        # sort like table
        else
        # sort like groups
        end
        changelog
      end

      attr_reader :changelog, :sort_order, :table_formatter, :ticket_order
    end
  end
end