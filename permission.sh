#!/bin/bash



echo -n "enter the file name"
read FILE

if [[ ! -e  "${FILE}" ]]
then
   echo "creating  ${FILE} file"
   touch $FILE
fi

echo "Permissions for $FILE:"
getfacl "${FILE}"

echo -n "Do you want to change permissions for this file? (yes/no): "
    read pem_change

     if [ "$pem_change" = "yes" ]; then
        
        echo -n "Enter new permissions : "
        read new_permissions

	chmod "$new_permissions" "$FILE"
        echo "Permissions changed to $new_permissions."
    else
	    echo "no changes"


     fi
getfacl $FILE
