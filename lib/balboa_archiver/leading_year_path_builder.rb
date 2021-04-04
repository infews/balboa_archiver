module BalboaArchiver
  class LeadingYearPathBuilder < PathBuilder
    def initialize(basename, match)
      @year = match[:year]
      @month_dir = ""
      @name = basename
    end
  end
end
