
module Kernel
  def whereis(file)
    path = whereis_sub(file)
    File.expand_path(path)
  end

  def whereis_sub(file)
    $:.each {|d|
      path = File.join(d, file)
      rb_path = path + '.rb'
      return rb_path if File.exist?(rb_path)
      so_path = path + '.so'
      return so_path if File.exist?(so_path)
    }

    $".each {|required|
      return required if required =~ /#{file}.rb/ || required =~ /#{file}.so/
    }

    raise "File not found \"#{file}\""
  end

end



