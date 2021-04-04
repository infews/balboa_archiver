module BalboaArchiver
  class FullNamePathBuilder < PathBuilder
    def initialize(basename, match)
      @year = match[:year]
      @month_dir = MONTH_DIRNAMES.fetch(match[:month])
      @name = basename
    end
  end
end
