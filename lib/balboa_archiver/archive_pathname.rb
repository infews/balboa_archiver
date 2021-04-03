module BalboaArchiver
  class ArchivePathname < Pathname
    VALID_LEADING_YEAR = /^(?<year>\d{4}).*/
    VALID_FULL_NAME = /^(?<year>\d{4})\.(?<month>\d{2}).*/
    FILETHIS_NAME = /^(?<doc>.*)(?<year>\d{4})-(?<month>\d{2})-(?<date>\d{2})(?<other>.*)\.pdf/

    class << self
      def for(path)
        return nil if path.nil?

        basename = File.basename(path)
        file_this_match = basename.match(FILETHIS_NAME)
        full_match = basename.match(VALID_FULL_NAME)
        year_match = basename.match(VALID_LEADING_YEAR)

        match = file_this_match || full_match || year_match

        return nil if match.nil?

        year = match[:year]
        month_dirname = month_from(match)
        name = name_from(basename, file_this_match)

        new(File.join(year, month_dirname, name))
      end

      private

      def month_from(match)
        return "" unless match.names.include?("month")

        MONTH_DIRNAMES.fetch(match[:month])
      end

      def name_from(basename, match)
        return basename if match.nil?

        name = match.values_at(:year, :month, :date)
        name << match[:doc].strip.tr(" ", ".").to_s
        name << match[:other].strip unless match[:other].empty?
        name << "pdf"

        name.join(".")
      end
    end
  end
end
