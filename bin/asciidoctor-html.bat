@set RUBY_BIN=C:\local\Ruby\bin

@set JRUBY_OPTS=-J-Xmx2g

%RUBY_BIN%\asciidoctor -b html %1

