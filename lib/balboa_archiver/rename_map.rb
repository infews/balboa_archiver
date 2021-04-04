module BalboaArchiver
  class RenameMap
    class << self
      def from(source_paths, &block)
        sources = Array(source_paths)

        maps = sources.each_with_object([]) do |src, to_copy|
          src_path = Pathname(src)
          renamed_pathname = ArchivePathname.for(src_path.basename)
          next if renamed_pathname.to_s.empty?

          dst_path = yield renamed_pathname

          to_copy << MapEntry.new(src_path, dst_path)
        end

        maps.sort
      end
    end

    private_class_method :new

    class MapEntry < Struct.new(:src, :dst)
      def <=>(other)
        dst <=> other.dst
      end
    end
  end
end
