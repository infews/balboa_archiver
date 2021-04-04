module BalboaArchiver
  class ArchivePathname < Pathname
    class << self
      def for(path)
        basename = File.basename(path || "empty")
        archive_path = PathBuilder.for(basename).path
        new(archive_path)
      end
    end
  end
end
