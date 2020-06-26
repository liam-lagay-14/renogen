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
        messages = ['Invalid items:']
        invalid_items.each { |item| messages << "Group: #{item.group_name}, Content: #{item.change}" }
        messages.join("\n")
      end
    end
  end
end
