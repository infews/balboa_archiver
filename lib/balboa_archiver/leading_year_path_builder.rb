module BalboaArchiver
  class LeadingYearPathBuilder < PathBuilder
    PATTERN = /^(?<year>\d{4}).*/

    def initialize(basename, match)
      @year = match[:year]
      @month_dir = ""
      @name = basename
    end
  end
end
