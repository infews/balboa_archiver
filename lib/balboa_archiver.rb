# frozen_string_literal: true

require_relative "balboa_archiver/archive_pathname"
require_relative "balboa_archiver/rename_map"
require_relative "balboa_archiver/version"
# require_relative "balboa_archiver/cli"

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

  MONTH_DIRNAMES = [
    "01.Jan",
    "02.Feb",
    "03.Mar",
    "04.Apr",
    "05.May",
    "06.Jun",
    "07.Jul",
    "08.Aug",
    "09.Sep",
    "10.Oct",
    "11.Nov",
    "12.Dec"
  ]
end
