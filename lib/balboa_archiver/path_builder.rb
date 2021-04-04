module BalboaArchiver
  class PathBuilder
    def initialize(basename, match)
      @year = @month_dir = @name = ""
    end

    def path
      File.join(@year, @month_dir, @name)
    end

    def self.for(basename)
      klass = if (match = basename.match(FileThisPathBuilder::PATTERN))
        FileThisPathBuilder
      elsif (match = basename.match(FullNamePathBuilder::PATTERN))
        FullNamePathBuilder
      elsif (match = basename.match(LeadingYearPathBuilder::PATTERN))
        LeadingYearPathBuilder
      else
        match = nil
        EmptyPathBuilder
      end

      klass.new(basename, match)
    end
  end
end
