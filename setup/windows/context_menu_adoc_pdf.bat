@set COMMAND=c:\local\Ruby23-x64\bin\asciidoctor-pdf -b pdf -a pdf-style=%%HOME%%\.config\asciidoctor\snoopy.yml

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name asciidoctor_pdf -action_cmd '%COMMAND%' -action_label 'Generate PDF'

