module Renogen
  # This is the conductor of the application
  class Generator
    attr_accessor :source, :version, :output_format, :options

    def initialize(version, source, output_format, options={})
      @version = version
      @source = source
      @output_format = output_format
      @options = options
    end

    # Create the change log
    def generate!
      changelog = extraction_stratagy.extract
      changelog.version = version
      changelog.date = options['release_date']
      validate_headings = options['validate_headings']

      require 'pry'; binding.pry
      validator.validate!(changelog) if validate_headings
      writer.write!(changelog)
    end

    protected

    def writer
      Renogen::ChangeLog::Writer.new(formatter)
    end

    def extraction_stratagy
      Renogen::ExtractionStratagies.obtain(source, options)
    end

    def formatter
      Renogen::Formatters.obtain(output_format, options)
    end

    def validator
      Renogen::ChangeLog::Validator.new(formatter)
    end
  end
end
