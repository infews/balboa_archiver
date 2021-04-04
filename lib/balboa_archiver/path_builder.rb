module BalboaArchiver
  class PathBuilder
    def initialize(basename, match)
      @year = @month_dir = @name = ""
    end

    def path
      File.join(@year, @month_dir, @name)
    end
  end
end
