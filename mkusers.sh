#!/bin/bash
ID=$(rig)
ID=(${ID[@]})
FirstName="${ID[0]}"
LastName="${ID[1]}"
Passwd=$(shuf -n1 /usr/share/dict/words | sed -e 's/['\'']/-/g')
UserName=$FirstName.$LastName

echo "First Name: "$FirstName
echo "Last Name: "$LastName
echo "UserName: "$UserName
echo "Passwd: "$Passwd

useradd -m -s /bin/bash "$UserName"

echo -e "$Passwd\n$Passwd\n" | passwd "$UserName"
mkdir -p /var/mail/$UserName
