@set RUBY_BIN=C:\local\Ruby\bin

@set JRUBY_OPTS=-J-Xmx2g

%RUBY_BIN%\asciidoctor-pdf -b pdf -a pdf-style=%HOME%\.config\asciidoctor\snoopy.yml %1

