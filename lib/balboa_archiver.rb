# frozen_string_literal: true

require "pathname"

require_relative "balboa_archiver/path_builder"
require_relative "balboa_archiver/empty_path_builder"
require_relative "balboa_archiver/file_this_path_builder"
require_relative "balboa_archiver/full_name_path_builder"
require_relative "balboa_archiver/leading_year_path_builder"
require_relative "balboa_archiver/archive_pathname"
require_relative "balboa_archiver/rename_map"
require_relative "balboa_archiver/version"
require_relative "cli"

module BalboaArchiver
  class Error < StandardError; end

  class NoSourceDirectoryError < StandardError
    def initialize(path)
      message = "Source directory #{path} does not exist"
      super(message)
    end
  end

  class NoDestinationDirectoryError < StandardError
    def initialize(path)
      message = "Destination directory #{path} does not exist"
      super(message)
    end
  end

  MONTH_DIRNAMES = {
    "01" => "01.Jan",
    "02" => "02.Feb",
    "03" => "03.Mar",
    "04" => "04.Apr",
    "05" => "05.May",
    "06" => "06.Jun",
    "07" => "07.Jul",
    "08" => "08.Aug",
    "09" => "09.Sep",
    "10" => "10.Oct",
    "11" => "11.Nov",
    "12" => "12.Dec"
  }
end
