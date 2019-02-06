# Options
param (
    [string]$file = '*',
    [string]$action_name = 'none',
    [string]$action_label = 'You did something bad...',
    [string]$action_cmd = 'nothing',
    [string]$action_icon = $null
 )



$reg_current_user = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('CurrentUser', '')


#------------------------------------------------------------------------------
# Compute the target class
#------------------------------------------------------------------------------
$target_class = ''


# Special case for ALL and Directory (we don't use class)
if ($file -eq '*' -or $file -eq 'Directory') {
        $target_class = $file;
} 

else {
        # Default value
        $target_class = $file.SubString(1) + '_auto_file' 
        # Check if a class already exists
        $key_file = $reg_current_user.OpenSubKey('Software\Classes\\' + $file)
        if ($key_file) {
                $default_value = $key_file.GetValue('')
                if ($default_value) {
                        $target_class = $default_value
                }
        }
        # Set the class (migth be already set...)
        $file_key = $reg_current_user.CreateSubKey('Software\Classes\\' + $file)
        $file_key.setValue('', $target_class, [Microsoft.Win32.RegistryValueKind]::String);
}


#------------------------------------------------------------------------------
# Append a command. 
# $args[0] : Path to the class to create
# $args[1] : Param to append to the command (e.g "$1" for file, "%V" for background dir. WTF ?)
#------------------------------------------------------------------------------
function create_command
{
        $class_path = $args[0]
        $parameter = $args[1]

        echo "Add '$action_label' to '$class_path' ..."

        $class_key = $reg_current_user.CreateSubKey($class_path)
        $shell_key = $class_key.CreateSubKey('shell')
        $action_key = $shell_key.CreateSubKey($action_name)
        $action_key.setValue('', $action_label, [Microsoft.Win32.RegistryValueKind]::ExpandString);
        if ($action_icon) {
                $action_key.setValue('Icon', $action_icon, [Microsoft.Win32.RegistryValueKind]::String);
        }
        $command_key = $action_key.CreateSubKey('command')
        $command_key.setValue('', $action_cmd + ' ' + $parameter, [Microsoft.Win32.RegistryValueKind]::ExpandString);        
}


# Main command
create_command "Software\\Classes\\$target_class" '"%1"'
# Command for directory background
if ($file -eq 'Directory') {
        create_command "Software\\Classes\\Directory\\Background" '"%V"'
}


# Done
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
