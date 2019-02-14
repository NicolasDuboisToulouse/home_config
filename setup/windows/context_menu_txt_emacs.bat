@set COMMAND=C:\local\emacs\bin\runemacs.exe

@powershell %~dp0\context_menu_add.ps1 -file .txt -action_name open -action_cmd %COMMAND% -action_label 'Edit with Emacs' -action_icon '%COMMAND%'

