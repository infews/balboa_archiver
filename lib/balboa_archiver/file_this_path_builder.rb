module BalboaArchiver
  class FileThisPathBuilder < PathBuilder
    PATTERN = /^(?<doc>.*)(?<year>\d{4})-(?<month>\d{2})-(?<date>\d{2})(?<other>.*)\.pdf/

    def initialize(basename, match)
      @year = match[:year]
      @month_dir = MONTH_DIRNAMES.fetch(match[:month])
      @name = rename(match)
    end

    private

    def rename(match)
      name = match.values_at(:year, :month, :date)
      name << dotted_doc_name_from(match)
      name << match[:other].strip unless match[:other].empty?
      name << "pdf"

      name.join(".")
    end

    def dotted_doc_name_from(match)
      match[:doc].strip.tr(" ", ".").to_s
    end
  end
end
