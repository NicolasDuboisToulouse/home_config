@call config.bat
@set COMMAND_EMACS=%EMACS_HOME%\bin\runemacs.exe

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name AsciidocFX_edit -action_cmd '%ASCIIDOCFX_BIN%' -action_label 'Edit (AsciidocFX)' -action_icon '%ASCIIDOCFX_BIN%'

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name Emacs_edit -action_cmd '%COMMAND_EMACS%' -action_label 'Edit (emacs)' -action_icon '%COMMAND_EMACS%' -default


pause
