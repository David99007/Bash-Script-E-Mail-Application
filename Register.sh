#!/bin/bash
Register() {
clear
echo "==================================================="
echo "||                                               ||"
echo "|| Welcome to the NAP-Mail Registration Services ||"
echo "||                                               ||"
echo "==================================================="
read -p "- Input Your Name     : " name
echo "________________________________________________"
read -p "- Input Your E-Mail   : " email
echo "________________________________________________"
read  -p "- Input Your Password : " password
echo ""

cd /home/ballgtodd/Desktop/E-Mail/Account
if [[ ! $name =~ [[:alnum:]] ]] && [[ ! $email =~ [[:alnum:]] ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		echo "E-Mail Can't be Empty"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]] && [[ $email =~ " " ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		echo "E-Mail Can't Contain Space"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]] && [[ ! $email =~ [[:alnum:]]+"@"+[[:alnum:]]+"."+[[:alnum:]] ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		echo "E-Mail Format is Wrong"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]] && [[ ! $email =~ [[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		echo "E-Mail Can't be Empty"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]] && [[ $email =~ " " ]]
	then
		echo "Name Can't be Empty"
		echo "E-Mail Can't Contain Space"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]] && [[ ! $email =~ [[:alnum:]]+"@"+[[:alnum:]]+"."+[[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		echo "E-Mail Format is Wrong"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ ! $email =~ [[:alnum:]] ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "E-Mail Can't be Empty"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ $email =~ " " ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "E-Mail Can't Contain Space"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ ! $email =~ [[:alnum:]]+"@"+[[:alnum:]]+"."+[[:alnum:]] ]] && [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "E-Mail Format is Wrong"
		echo "Password Can't be Empty"
		read enter
		Register
elif [[ ! $name =~ [[:alnum:]] ]]
	then
		echo "Name Can't be Empty"
		read enter
		Register
elif [[ ! $email =~ [[:alnum:]] ]]
	then
		echo "E-Mail Can't be Empty"
		read enter
		Register
elif [[ $email =~ " " ]]
	then
		echo "E-Mail Can't Contain Space"
		read enter
		Register
elif [[ ! $email =~ [[:alnum:]]+"@"+[[:alnum:]]+"."+[[:alnum:]] ]]
	then
		echo "E-Mail Format is Wrong"
		read enter
		Register
elif [[ ! $password =~ [[:alnum:]] ]]
	then
		echo "Password Can't be Empty"
		read enter
		Register
else
	if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$email" ]
		then
			echo "Making Your E-Mail ..."
			Loading
			mkdir $email
			cd $email
			mkdir Inbox
			cd Inbox
			touch mail.lst
			echo "Back" >> mail.lst
			cd ..
			mkdir Outbox
			cd Outbox
			touch mail.lst
			echo "Back" >> mail.lst
			cd ..
			touch Name.txt
			echo "$name" > Name.txt
			touch Password.txt
			echo "$password" > Password.txt
			echo "Email Has Been Made"
			read enter
			Register
	else
		echo "Sorry, Email is Already Taken"
		read enter
		Register
	fi
fi
}

Loading() {
echo -ne '{#####                                             }( 10%)\r'
sleep 1
echo -ne '{##########                                        }( 20%)\r'
sleep 1
echo -ne '{####################                              }( 40%)\r'
sleep 2
echo -ne '{#########################                         }( 50%)\r'
sleep 1
echo -ne '{###################################               }( 70%)\r'
sleep 2
echo -ne '{#############################################     }( 90%)\r'
sleep 1
echo -ne '{##################################################}(100%)\r'
echo -ne '\n'
}

Register
