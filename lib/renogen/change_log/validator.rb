module Renogen
  module ChangeLog
    # Validates the change log
    class Validator
      def initialize(formatter)
        @formatter = formatter
        @validate_headings = formatter.options['validate_headings']
        @validation_properties = formatter.options['validation_properties']
      end

      # Writes out the change log
      #
      # @param changelog [ChangeLog::Model]
      def validate!(changelog)
        validate_release_note_headings(changelog)
        # puts formatter.write_header(formatter.header(changelog))
        # output_groups(changelog.groups)
        # puts formatter.write_footer(changelog)
      end

      protected

      attr_reader :formatter, :validate_headings, :validation_properties

      def validate_release_note_headings(changelog)
        items_to_validate = changelog.items
          .select { |item| validate_headings.include?(item.group_name) }

        return if items_to_validate.empty?

        validate_properties(changelog)
      end

      private

      def validate_properties(changelog)
        invalid_items = []
        validate_headings.each do |heading|
          valid_properties = validation_properties[heading.downcase]

          items_to_select = changelog.items.select { |log| log.group_name == heading }
          invalid_items << items_to_select.reject { |item| (changes_to_validate(item.change) - valid_properties).empty? }
        end
        invalid_items = invalid_items.flatten
        raise Renogen::Exceptions::InvalidItemFound.new(invalid_items) unless invalid_items.empty?
      end

      def changes_to_validate(change)
        return [change] if change.is_a? String
        change
      end
    end
  end
end
