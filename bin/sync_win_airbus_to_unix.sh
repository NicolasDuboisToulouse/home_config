#!/bin/bash

#
# What to backup
#
count=0

# Notes
EXCLUDE[$count]=""
SRC[$count]=/c/users/to74866/Desktop/NOTES
((count++))

# Proxy_KVM_PDU
EXCLUDE[$count]=""
SRC[$count]=/c/users/to74866/Desktop/Proxy_KVM_PDU
((count++))

# Divers
EXCLUDE[$count]=""
SRC[$count]=/c/users/to74866/Desktop/Divers
((count++))

# Mails
EXCLUDE[$count]="--exclude *tmp"
SRC[$count]=/c/users/to74866/Documents/Outlook/PST
((count++))

# Sigma
EXCLUDE[$count]="--exclude Git --exclude *Workspace*"
SRC[$count]=/c/users/to74866/Desktop/SIGMA
((count++))



#
# Where to backup
#
DST=/y/COMPTE/BACKUP/


#
# Setup
#
MSYS=/c/local/MinGW/msys/1.0
RSYNC=${MSYS}/bin/rsync.exe
PATH=$PATH:${MSYS}/bin

#
# Let's go
#
i=0
while [ $i -lt $count ]; do
    echo "--------------------------------------------------"
    echo "Backup `basename ${SRC[$i]}`"
    echo "--------------------------------------------------"


    ARGS=(${RSYNC}
        -v              # Verbose
        -r              # Recursive
        -l              # Kip symblinks
        -t              # Preserve time
        --delete-after  # Delete removed file after update
        --stats         # Some infos
        --progress      # Show Progression
        ${EXCLUDE[$i]}    # What to ignore
        ${SRC[$i]}
        ${DST}
)
    
    echo ${ARGS[@]}    
    ${ARGS[@]}
    echo
    echo

    ((i++))
done


echo 
echo "Press any key to close..."
read -s -n 1

