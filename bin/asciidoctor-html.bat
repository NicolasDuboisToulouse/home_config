call %HOME%\.config\setup\windows\config.bat

@set JRUBY_OPTS=-J-Xmx2g

%RUBY_BIN_DIR%\asciidoctor -b html %1

