def read_file( filename )
  ret = ''
  File.open(filename,'r').each_line do |line|
    ret += line
  end
  ret
end
