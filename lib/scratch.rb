# bin/copy src dst -r

def copy(src, dst, options = {})
  destination_path = Pathname(dst)
  src_paths = Pathname(src).glob("*")

  copiers = src_paths.each_with_object([]) do |src_path, all|
    renamed_pathname = ArchivePathname(src_path.basename)
    if renamed_pathname
      all << Copier.new(src_path, Pathname(destination_path + renamed_pathname.basename), options)
    end
  end

  copiers.each { |c| c.copy }
end

# bin/copy_to_archive src dst_with_archive -r

def copy_to_archive(src, dst_with_archive, options = {})
  destination_path = Pathname(dst_with_archive)
  src_paths = Pathname(src).glob("*")

  copiers = src_paths.each_with_object([]) do |src_path, all|
    renamed_pathname = ArchivePathname(src_path.basename)
    if renamed_pathname
      all << Copier.new(src_path, Pathname(destination_path + renamed_pathname), options)
    end
  end

  copiers.each { |c| c.copy }
end
