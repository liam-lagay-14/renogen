module Renogen
  module Formatters
    # For formatting a change into markdown format
    class Markdown < Base
      register :markdown
      register :md

      # Outputs a line or block of text appearing at the top of the change log.
      #
      # @param header [String]
      # @return [String]
      def write_header(header)
        "# #{header}\n\n"
      end

      # Outputs a line or block as a header for a group.
      #
      # @param group [String]
      # @return [String]
      def write_group(group)
        "## #{group}\n\n"
      end

      # Outputs a line or block as the body for a change.
      #
      # @param change [String]
      # @return [String]
      def write_change(change)
        return format_output(change) if change.is_a? Hash

        "* #{change}"
      end

      def format_output(change)
        output = ''
        change.each_with_index do |(key, value), idx|
          content = (value.is_a? Array) ? create_indented_section(value) : value
          if idx.zero?
            output += "* #{key}: #{content}\n"
          else
            output += "    * #{key}: #{content}\n"
          end
        end
        output + "\n"
      end

      def create_indented_section(value)
        content = "\n"
        value.each do |val|
          next if text_already_appears?(content, val)
          content += "        * #{val} \n"
        end
        content
      end

      def text_already_appears?(content, value)
        content.include?(value)
      end
    end
  end
end
