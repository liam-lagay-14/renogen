module Renogen
  module Formatters
    # For formatting a change into csv format
    class Csv < Base
      register :csv

      # Outputs a line or block of text appearing at the top of the change log.
      #
      # @param header [String]
      # @return [String]
      def write_header(header)
        ''
      end

      # Outputs a line or block as a header for a group.
      #
      # @param group [String]
      # @return [String]
      def write_group(group)
        "#{group},"
      end

      # Outputs a line or block of text appearing after a group.
      #
      # @return [String]
      def write_group_end
        ''
      end

      # Outputs a line or block as the body for a change.
      #
      # @param change [String]
      # @return [String]
      def write_change(change)
        return format_output(change) if change.is_a? Hash

        "  <li>#{change}</li>"
      end

      def format_output(change)
        # output = ''
        #
        # change.each_with_index do |(key, value), idx|
        #   default_text = "<p>#{key}: #{value}</p>"
        #
        #   output += (value.is_a? Array) ? create_sub_list(key, value) : default_text
        # end
        # output
      end

      def create_sub_list(key, value)
        # content = write_list_start(key)
        # value.each do |val|
        #   next if text_already_appears?(content, val)
        #   content += "  <li>#{val}</li>"
        # end
        # content += write_list_end
        # content
      end

      # Outputs a line or block of text appearing at the bottom of the change log.
      #
      # @param changelog [ChangeLog]
      # @return [String]
      def write_footer(changelog)
        ''
      end
    end
  end
end
