# frozen_string_literal: true

module Renogen
  module Exceptions
    # Raised when an extraction stratagy for a given key can not be found
    class InvalidItemFound < Base
      attr_reader :invalid_items

      def initialize(invalid_items)
        @invalid_items = invalid_items
        super
      end

      # Friendly error message
      #
      # @return [String]
      def message
        message = "Invalid items: \n\n"
        invalid_items.each { |item| message << "Group: #{item.group_name}, Content: #{item.change}\n" }
        message
      end
    end
  end
end
