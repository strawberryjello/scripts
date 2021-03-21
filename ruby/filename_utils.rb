module FilenameUtils
  def left_zero_pad(string, max_length)
    return string if string.length == max_length

    '0' * (max_length - string.length) + string
  end

  def zero_pad(filename)
    base, extension = filename.split('.')
    numeric_suffix = base.slice!(/[0-9]+$/)

    base + left_zero_pad(numeric_suffix, 3) + '.' + extension
  end

  def zero_pad_all(dir)
    Dir.foreach(dir) do |f|
      next if f == '.' || f == '..'

      if Dir.exist?(f)
        zero_pad_all(f)
      else
        new_filename = zero_pad(f)
        puts new_filename

        File.rename(File.join(dir, f), File.join(dir, new_filename))
      end
    end
  end

  def rename_to_number(dir, filenames)
    separator = "."
    counter = 1

    filenames.each do |f|
      extension = f.split(separator)[1]
      page_number = left_zero_pad(counter.to_s, 3)
      new_filename = page_number + separator + extension
      puts new_filename
      counter += 1

      File.rename(File.join(dir, f), File.join(dir, new_filename))
    end
  end
end
