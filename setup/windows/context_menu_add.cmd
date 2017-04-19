@REM This is a script and not a .reg because :
@REM 1/ We can "run as administrator"
@REM 2/ We can change default key type to REG_EXPAND_SZ to use variables

@REM usage: call context_menu_add.cmd <file_pattern> <key_name> <command> <label>
@REM <file_pattern>: something like '*' or '.bat' or 'Directory'
@REM <key_name>    : Aphabetical string for the key
@REM <command>     : command to call (might include %%%%1)
@REM <label>       : Text to display

@set KEY="HKEY_CLASSES_ROOT\%1\shell\%2"
@set KEY_CMD="HKEY_CLASSES_ROOT\%1\shell\%2\Command"

reg.exe add %KEY% /ve /t REG_EXPAND_SZ /d %4%
reg.exe add %KEY_CMD% /ve /t REG_EXPAND_SZ /d %3%

pause
