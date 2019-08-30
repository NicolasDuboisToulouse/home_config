@call config.bat
@set COMMAND="%MSYS2_HOME%\msys2_shell.cmd -where "
@set ICON="%MSYS2_HOME%\msys2.ico"

@powershell %~dp0\context_menu_add.ps1 -file Directory -action_name msys -action_cmd '%COMMAND%' -action_label 'Console MSYS here' -action_icon '%ICON%'

