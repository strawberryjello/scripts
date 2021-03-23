#!/usr/bin/env ruby

require_relative 'filename_utils'

include FilenameUtils

dir = "."
filenames = Dir.children(dir)
# filenames = Dir.children(dir).sort.reverse

FilenameUtils.rename_to_number(dir, filenames)
