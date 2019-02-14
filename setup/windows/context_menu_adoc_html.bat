@set COMMAND=%%HOME%%\.config\bin\asciidoctor-html.bat

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name asciidoctor_html -action_cmd '%COMMAND%' -action_label 'Generate HTML' -action_icon "%HOME%\.config\icons\html.ico"
