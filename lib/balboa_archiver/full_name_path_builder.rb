module BalboaArchiver
  class FullNamePathBuilder < PathBuilder
    PATTERN = /^(?<year>\d{4})\.(?<month>\d{2}).*/

    def initialize(basename, match)
      @year = match[:year]
      @month_dir = MONTH_DIRNAMES.fetch(match[:month])
      @name = basename
    end
  end
end
