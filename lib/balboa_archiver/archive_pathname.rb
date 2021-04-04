module BalboaArchiver
  class ArchivePathname < Pathname
    VALID_LEADING_YEAR = /^(?<year>\d{4}).*/
    VALID_FULL_NAME = /^(?<year>\d{4})\.(?<month>\d{2}).*/
    FILETHIS_NAME = /^(?<doc>.*)(?<year>\d{4})-(?<month>\d{2})-(?<date>\d{2})(?<other>.*)\.pdf/

    class << self
      def for(path)
        basename = File.basename(path || "empty")
        path_builder = path_builder_for(basename)
        new(path_builder.path)
      end

      private

      def path_builder_for(basename)
        klass = if (match = basename.match(FILETHIS_NAME))
          FileThisPathBuilder
        elsif (match = basename.match(VALID_FULL_NAME))
          FullNamePathBuilder
        elsif (match = basename.match(VALID_LEADING_YEAR))
          LeadingYearPathBuilder
        else
          match = nil
          EmptyPathBuilder
        end

        klass.new(basename, match)
      end
    end
  end
end
