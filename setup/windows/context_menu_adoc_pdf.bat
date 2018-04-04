@set COMMAND=%%HOME%%\.config\bin\asciidoctor-pdf.bat

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name asciidoctor_pdf -action_cmd '%COMMAND%' -action_label 'Generate PDF'

