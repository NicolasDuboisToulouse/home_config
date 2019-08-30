call %HOME%\.config\setup\windows\config.bat

@set JRUBY_OPTS=-J-Xmx2g

%RUBY_BIN_DIR%\asciidoctor-pdf -b pdf -a pdf-style=%HOME%\.config\asciidoctor\snoopy.yml %1

