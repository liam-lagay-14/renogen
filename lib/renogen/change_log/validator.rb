module Renogen
  module ChangeLog
    # Validates the change log
    class Validator
      def initialize(formatter)
        @formatter = formatter
        @validate_headings = formatter.options['validate_headings']
      end

      # Writes out the change log
      #
      # @param changelog [ChangeLog::Model]
      def validate!(changelog)
        require 'pry'; binding.pry
        # puts formatter.write_header(formatter.header(changelog))
        # output_groups(changelog.groups)
        # puts formatter.write_footer(changelog)
      end

      protected

      attr_reader :formatter, :validate_headings

      # def output_change(change)
      #   if change.list?
      #     change.each { |item| puts formatter.write_change(item) }
      #   else
      #     puts formatter.write_change(change.to_s) if change.to_s.size > 0
      #   end
      # end

      # def output_groups(groups)
      #   groups.each do |group, changes|
      #     puts formatter.write_group(group)
      #     changes.each { |change| output_change(change) }
      #     puts formatter.write_group_end
      #   end
      # end
    end
  end
end
