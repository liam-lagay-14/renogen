module Renogen
  # Custom exceptions throw by the libary
  module Exceptions
    require_relative 'exceptions/base'
    require_relative 'exceptions/stratagy_not_found'
    require_relative 'exceptions/invalid_item_found'
  end
end
