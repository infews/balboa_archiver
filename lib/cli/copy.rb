require "thor"

module BalboaArchiver
  class CLI < Thor
    include Thor::Actions

    desc "copy SRC DST", "copies all dated files in SRC to DST, renaming to common format"
    def copy(src, dst)
      raise NoSourceDirectoryError.new(src) unless File.exist?(src)
      raise NoDestinationDirectoryError.new(dst) unless File.exist?(dst)

      source_directory = Pathname(src)
      destination_path = Pathname(dst)

      maps = RenameMap.from(source_directory.glob("*")) do |destination_file|
        Pathname(destination_path + destination_file.basename)
      end

      say "Found #{maps.length} files to copy to #{destination_path}", CYAN

      maps.each do |map|
        puts "copying #{map.dst.basename}"
        system "cp -u #{map.src.expand_path} #{map.dst.expand_path}"
      end
    end
  end
end
