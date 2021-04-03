require 'FileUtils'

module BalboaArchiver
  class CLI < Thor
    include Thor::Actions

    desc "archive SRC DST", "copies all dated files in SRC to DST in /<year>/<month>, renaming to common format"
    def archive(src, dst)
      raise NoSourceDirectoryError.new(src) unless File.exist?(src)
      raise NoDestinationDirectoryError.new(dst) unless File.exist?(dst)

      source_directory = Pathname(src)
      destination_directory = Pathname(dst)

      maps = RenameMap.from(source_directory.glob("**/*")) do |destination_file|
        Pathname(destination_directory + destination_file)
      end

      say "Found #{maps.length} files to copy to #{destination_directory}", :cyan

      maps.each do |map|
        make_archive_subdir(map.dst.split.first)

        say "copying #{map.dst.basename}"
        FileUtils.cp map.src.expand_path, map.dst.expand_path
      end
    end

    no_tasks do
      def make_archive_subdir(directory)
        return if directory.exist?

        say "Making archive year and month folder #{directory}", :green
        Dir.mkdir(directory)
      end
    end
  end
end
