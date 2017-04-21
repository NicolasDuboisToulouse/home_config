@set COMMAND=%%HOME%%\.config\bin\msys_explorer_context.bat

@powershell %~dp0\context_menu_add.ps1 -file Directory -action_name msys -action_cmd %COMMAND% -action_label 'MinGW here'
