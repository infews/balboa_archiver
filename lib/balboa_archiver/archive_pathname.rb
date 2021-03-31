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

        year, month_dirname = directories_from(match)
        name = if file_this_match.nil?
          basename
        else
          name_from(file_this_match)
        end

        new(File.join(year, month_dirname, name))
      end

      private

      def directories_from(match)
        captures = match.named_captures

        year = captures.fetch("year")
        m = captures.fetch("month", "")

        month_dirname = if m == ""
          ""
        else
          MONTH_DIRNAMES[m.to_i - 1]
        end

        [year, month_dirname]
      end

      def name_from(file_this_match)
        year, month, date = file_this_match.values_at(:year, :month, :date)
        doc = file_this_match[:doc]
        other = file_this_match[:other]

        rest_of_name = doc.strip.tr(" ", ".").to_s
        rest_of_name += ".#{other.strip}" unless other.empty?

        [year, month, date, rest_of_name, "pdf"].join(".")
      end
    end
  end
end
