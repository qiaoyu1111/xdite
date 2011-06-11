require 'rbconfig'
# Xcode 2.2 moved ruby.h 
unless File.exist? File.join(Config::CONFIG['archdir'], 'ruby.h')
  Config::CONFIG['archdir'] = Config::CONFIG['archdir'].sub(/powerpc/, 'universal')
end

require 'mkmf'

def command(cmd)
  $stderr.puts "execute '#{cmd}' ..."
  raise(RuntimeError, cmd) unless system(cmd)
  $stderr.puts "execute '#{cmd}' done"
end

$CFLAGS = '-F../../framework/build'
$LDFLAGS  = '-F../../framework/build -framework RubyCocoa'

$CFLAGS << ' -fno-common -g -fobjc-exceptions -Wall -arch ppc -arch i386 -arch x86_64 -DRB_ID=ID -I/usr/include/libxml2 -DHAS_LIBXML2  -I/usr/include/ffi  -DMACOSX '
$LDFLAGS << ' -undefined suppress -flat_namespace -arch ppc -arch i386 -arch x86_64 -lxml2  -lffi '

create_makefile('rubycocoa')
command "mv -f Makefile Makefile.bak"
command "sed -e 's/-no-cpp-precomp//' -e 's/-no-precomp//' Makefile.bak > Makefile"
