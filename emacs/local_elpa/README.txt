Setup local elpa archive for host without internet access


1/ On an host WITH internet access, update packages in emacs: auto-package-update-now
2/ Run the script create_archive.sh
3/ Copy archives folder on hosts without internet access
4/ Configure ~/.emacs_local.el (see dot_emacs_local.el)
5/ update packages
