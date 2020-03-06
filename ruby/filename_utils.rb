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
end
