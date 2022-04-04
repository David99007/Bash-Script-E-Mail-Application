#!/bin/bash
Login() {
clear
echo "==============================================="
echo "    Welcome to the E-Mail Login Services       "
echo "==============================================="
read -p "- E-Mail   : " email
cd /home/ballgtodd/Desktop/E-Mail/Account
if [ -d "/home/ballgtodd/Desktop/E-Mail/Account/$email" ]
then
	cd $email
	read  -p "- Password : " password
	Pass=$(cat Password.txt)
	if [[ $password =~ $Pass ]]
	then
		echo ""
		echo "_____________"
		echo "Login Success"
		echo "============="
		read enter
		MainMenu
	else
		echo ""
		echo "_______________________________________________"
		read -p "Wrong Password!!" enter
		read -p "Do You Want to Restore Your Password ? (Y/N) : " CC
		if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
		then
			Guide
		elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
		then
			exit
		else
			echo "Choose Correctly!!"
			read enter
			Login
		fi
	fi
else
	echo ""
	echo "_____________________"
	echo "E-Mail Does not Exist"
	echo "====================="
	read enter
	Login
fi
}

MainMenu() {
clear
cd /home/ballgtodd/Desktop/E-Mail/Account/$email
echo "=========================================="
Name="Name.txt"
while read name ; do
echo "Welcome $name !!"
done < "$Name"
echo "=========================================="
echo "What do You Wanna do? "
echo "=========================================="
echo "1. Write Mail            4. Reset Password"
echo "2. Check Inbox           5. Delete Mail   "
echo "3. Check Outbox          6. Log Out       "
echo "=========================================="
read -p " - Your Choice : " CC

if [ $CC == 1 ]
then
	Mailer
elif [ $CC == 2 ]
then
	Inbox
elif [ $CC == 3 ]
then
	Outbox
elif [ $CC == 4 ]
then
	ResetPassword
elif [ $CC == 5 ]
then
	DeleteMail
elif [ $CC == 6 ]
then
	Login
fi
}

Mailer() {
clear
echo "========================================================================"
echo "||                         Mailer Service                             ||"
echo "========================================================================"
read -p " - Destination Mail : " destmail
echo "========================================================================"
if [[ ! $destmail =~ $email ]]
then
	if [ -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail" ]
	then
		read -p " - Subject : " subject
		echo "========================================================================"
		if [[ $subject =~ [[:alnum:]] ]]
		then
			echo " - Mail : "
			echo "========================================================================"
			read mail
			if [[ $mail =~ [[:alnum:]] ]]
			then
				echo ""
				echo "========================================================================"
				echo "Please Wait While Sending the Message ..."
				Loading2
				echo "========================================================================"
				cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
				if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail" ]
				then
					echo "$destmail" >> mail.lst
					mkdir $destmail
					cd $destmail
					if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
					then
						touch sub.lst
						echo "Back" >> sub.lst
						touch "$subject"
						echo "$subject" >> sub.lst
						echo "Date    : "$(date) >> "$subject"
						echo "To      : $destmail" >> "$subject"
						echo "Subject : $subject" >> "$subject"
						echo "Mail    : " >> "$subject"
						echo "$mail" >> "$subject"
						echo "" >> "$subject"
						cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
						if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
						then
							echo "$email" >> mail.lst
							mkdir $email
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						else
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						fi
						echo "Mail Sent"
						read -p "Do You Want to Continue? (Y/N) : " CC
						if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
						then
							MainMenu
						elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
						then
							Login
						else
							exit
						fi
					elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
					then
						touch "$subject"
						echo "$subject" >> sub.lst
						echo "Date    : "$(date) >> "$subject"
						echo "To      : $destmail" >> "$subject"
						echo "Subject : $subject" >> "$subject"
						echo "Mail    : " >> "$subject"
						echo "$mail" >> "$subject"
						echo "" >> "$subject"
						cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
						if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
						then
							echo "$email" >> mail.lst
							mkdir $email
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						else
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						fi
						echo "Mail Sent"
						read -p "Do You Want to Continue? (Y/N) : " CC
						if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
						then
							MainMenu
						elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
						then
							Login
						else
							exit
						fi
					else
						echo "Date    : "$(date) >> "$subject"
						echo "To      : $destmail" >> "$subject"
						echo "Subject : $subject" >> "$subject"
						echo "Mail    : " >> "$subject"
						echo "$mail" >> "$subject"
						echo "" >> "$subject"
						cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
						if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
						then
							echo "$email" >> mail.lst
							mkdir $email
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						else
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						fi
						echo "Mail Sent"
						read -p "Do You Want to Continue? (Y/N) : " CC
						if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
						then
							MainMenu
						elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
						then
							Login
						else
							exit
						fi
					fi
				else
					cd $destmail
					if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
					then
						touch sub.lst
						echo "Back" >> sub.lst
						touch "$subject"
						echo "$subject" >> sub.lst
						echo "Date    : "$(date) >> "$subject"
						echo "To      : $destmail" >> "$subject"
						echo "Subject : $subject" >> "$subject"
						echo "Mail    : " >> "$subject"
						echo "$mail" >> "$subject"
						echo "" >> "$subject"
						cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
						if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
						then
							echo "$email" >> mail.lst
							mkdir $email
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						else
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						fi
						echo "Mail Sent"
						read -p "Do You Want to Continue? (Y/N) : " CC
						if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
						then
							MainMenu
						elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
						then
							Login
						else
							exit
						fi
					elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
					then
						touch "$subject"
						echo "$subject" >> sub.lst
						echo "Date    : "$(date) >> "$subject"
						echo "To      : $destmail" >> "$subject"
						echo "Subject : $subject" >> "$subject"
						echo "Mail    : " >> "$subject"
						echo "$mail" >> "$subject"
						echo "" >> "$subject"
						cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
						if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
						then
							echo "$email" >> mail.lst
							mkdir $email
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						else
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						fi
						echo "Mail Sent"
						read -p "Do You Want to Continue? (Y/N) : " CC
						if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
						then
							MainMenu
						elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
						then
							Login
						else
							exit
						fi
					else
						echo "Date    : "$(date) >> "$subject"
						echo "To      : $destmail" >> "$subject"
						echo "Subject : $subject" >> "$subject"
						echo "Mail    : " >> "$subject"
						echo "$mail" >> "$subject"
						echo "" >> "$subject"
						cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
						if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
						then
							echo "$email" >> mail.lst
							mkdir $email
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						else
							cd $email
							if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
							then
								touch sub.lst
								echo "Back" >> sub.lst
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$subject" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ] 
							then
								touch "$subject"
								echo "$subject" >> sub.lst
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							else
								echo "Date    : "$(date) >> "$subject"
								echo "From    : $email" >> "$subject"
								echo "Subject : $subject" >> "$subject"
								echo "Mail    : " >> "$subject"
								echo "$mail" >> "$subject"
								echo "" >> "$subject"
							fi
						fi
						echo "Mail Sent"
						read -p "Do You Want to Continue? (Y/N) : " CC
						if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
						then
							MainMenu
						elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
						then
							Login
						else
							exit
						fi
					fi
				fi
			else
				echo "Mail Must be Filled"
				read enter
				Mailer
			fi
		else
			echo "Subject Must be Filled"
			read enter
			Mailer
		fi
	else
		echo "Destination Mail is not Available"
		read enter
		Mailer
	fi
else
	echo "You Can't Send a Message to Yourself"
	read enter
	Mailer
fi
}

Inbox() {
clear
cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Inbox
mail=$(cat mail.lst|fzf)
if [[ $mail =~ "Back" ]]
then
	MainMenu
else
	cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Inbox/$mail
	sub=$(cat sub.lst|fzf)
	if [[ "$sub" =~ "Back" ]]
	then
		Inbox
	else
		cat "$sub"
		echo "What do You Want to Do?"
		echo "1. Reply"
		echo "2. Main Menu"
		read -p "Your Choice : " CC
		if [ $CC == 1 ]
		then
			Reply
		elif [ $CC == 2 ]
		then
			MainMenu
		else
			read -p "Not an Option" enter
			Inbox
		fi
	fi
fi
}

Reply() {
clear
echo "Reply to : $mail"
echo "Subject  : $sub"
echo "Mail     : "
read repmail
if [[ $repmail =~ [:alnum:] ]]
then
	echo ""
	echo "========================================================================"
	echo "Please Wait While Sending the Message ..."
	Loading2
	echo "========================================================================"
	if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail" ]
	then
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
		echo "$mail" >> mail.lst
		mkdir $mail
		cd $mail
		if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/sub.lst" ]
			then
			touch sub.lst
			echo "Back" >> sub.lst
			touch "$sub"
			echo "$sub" >> sub.lst
			echo "Date    : "$(date) >> "$sub"
			echo "To      : $mail" >> "$sub"
			echo "Subject : $sub" >> "$sub"
			echo "Mail    : " >> "$sub"
			echo "$repmail" >> "$sub"
			echo "" >> "$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email" ]
				then
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$mail" >> "$sub"
					echo "" >> "$sub"
				fi
			else
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/sub.lst" ]
		then
			touch "$sub"
			echo "$sub" >> sub.lst
			echo "Date    : "$(date) >> "$sub"
			echo "To      : $mail" >> "$sub"
			echo "Subject : $sub" >> "$sub"
			echo "Mail    : " >> "$sub"
			echo "$repmail" >> "$sub"
			echo "" >> "$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email" ]
			then
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			else
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		else
			echo "Date    : "$(date) >> "$sub"
			echo "To      : $mail" >> "$sub"
			echo "Subject : $sub" >> "$sub"
			echo "Mail    : " >> "$sub"
			echo "$repmail" >> "$sub"
			echo "" >> "$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email" ]
			then
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$mail" >> "$sub"
					echo "" >> "$sub"
				fi
			else
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		fi
	else
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
		cd $mail
		if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/sub.lst" ]
		then
			touch sub.lst
			echo "Back" >> sub.lst
			touch "$sub"
			echo "$sub" >> sub.lst
			echo "Date    : "$(date) >> "$sub"
			echo "To      : $mail" >> "$sub"
			echo "Subject : $sub" >> "$sub"
			echo "Mail    : " >> "$sub"
			echo "$repmail" >> "$sub"
			echo "" >> "$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email" ]
			then
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
							elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			else
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail/sub.lst" ]
		then
			touch "$sub"
			echo "$sub" >> sub.lst
			echo "Date    : "$(date) >> "$sub"
			echo "To      : $mail" >> "$sub"
			echo "Subject : $sub" >> "$sub"
			echo "Mail    : " >> "$sub"
			echo "$repmail" >> "$sub"
			echo "" >> "$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email" ]
			then
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			else
					cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
					fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		else
			echo "Date    : "$(date) >> "$sub"
			echo "To      : $mail" >> "$sub"
			echo "Subject : $sub" >> "$sub"
			echo "Mail    : " >> "$sub"
			echo "$repmail" >> "$sub"
			echo "" >> "$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email" ]
			then
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			else
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ]
				then
					touch sub.lst
					echo "Back" >> sub.lst
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
					elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$mail/Inbox/$email/sub.lst" ] 
				then
					touch "$sub"
					echo "$sub" >> sub.lst
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $sub" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				else
					echo "Date    : "$(date) >> "$sub"
					echo "From    : $email" >> "$sub"
					echo "Subject : $subject" >> "$sub"
					echo "Mail    : " >> "$sub"
					echo "$repmail" >> "$sub"
					echo "" >> "$sub"
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		fi
	fi
else
	echo "Mail Must be Filled!!"
	read enter
	Reply
fi
}

Outbox() {
clear
cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
mail=$(cat mail.lst|fzf)
if [[ $mail =~ "Back" ]]
then
	MainMenu
else
	cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
	sub=$(cat sub.lst|fzf)
	if [[ "$sub" =~ "Back" ]]
	then
		Outbox
	else
		cat "$sub"
		echo "What do You Want to Do?"
		echo "1. Forward"
		echo "2. Main Menu"
		read -p "Your Choice : " CC
		if [ $CC == 1 ]
		then
			Forward
		elif [ $CC == 2 ]
		then
			MainMenu
		else
			read -p "Not an Option" enter
			Outbox
		fi
	fi
fi
}

Forward() {
clear
read -p "Destination Mail : " destmail
if [ -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail" ] && [[ ! $destmail =~ $email ]]
then
	echo ""
	echo "========================================================================"
	echo "Please Wait While Sending the Message ..."
	Loading2
	echo "========================================================================"
	if [ ! -d  "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail" ]
	then
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
		echo "$destmail" >> mail.lst
		mkdir $destmail
		cd $destmail
		if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
		then
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
			cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			touch sub.lst
			echo "Back" >> sub.lst
			echo "$sub" >> sub.lst
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
			then
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			else
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
		then
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
			cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			echo "$sub" >> sub.lst
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
			then
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			else
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi		
		else
			rm /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/"$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
			cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
			then
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			else
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		fi
	else
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
		cd $destmail
		if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
		then
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
			cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			touch sub.lst
			echo "Back" >> sub.lst
			echo "$sub" >> sub.lst
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
			then
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			else
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/sub.lst" ]
		then
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
			cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			echo "$sub" >> sub.lst
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
			then
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			else
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi
		else
			rm /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail/"$sub"
			cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
			cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$destmail
			if [ ! -d "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email" ]
			then
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				echo "$email" >> mail.lst
				mkdir $email
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			else
				cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox
				cd $email
				if [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					touch sub.lst
					echo "Back" >> sub.lst
					echo "$sub" >> sub.lst
				elif [ ! -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/$sub" ] && [ -f "/home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/sub.lst" ]
				then
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					cd /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
					echo "$sub" >> sub.lst
				else
					rm /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email/"$sub"
					cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$mail
					cp "$sub" /home/ballgtodd/Desktop/E-Mail/Account/$destmail/Inbox/$email
				fi
			fi
			echo "Mail Sent"
			read -p "Do You Want to Continue? (Y/N) : " CC
			if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
			then
				MainMenu
			elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
			then
				Login
			else
				exit
			fi		
		fi
	fi
elif [[ $destmail =~ $email ]]
then
	echo "You Can't Forward This Mail to Your Own E-Mail"
	read enter
	Forward
else
	echo "E-Mail That You Input is not Available"
	read enter
	Forward
fi
}

ResetPassword() {
clear
cd /home/ballgtodd/Desktop/E-Mail/Account/$email
echo "Do You Really Want to Reset Password??"
echo "1. Yes"
echo "2. No"
read -p "Your Choice : " CC
if [ $CC == 1 ]
then
	clear
	read  -p "Input Your Old Password    : " password
	Pass=$(cat Password.txt)
	if [[ $password =~ $Pass ]]
	then
		echo ""
		read  -p "Input Your New Password    : " newpass
		if [[ $newpass =~ $Pass ]]
		then
			echo ""
			read -p "You're Using Your Old Password... Please Use the New One!!" enter
			ResetPassword
		else
			echo ""
			read  -p "Re-input Your New Password : " newpass2
			if [[ $newpass2 =~ $newpass ]]
				then
				echo "$newpass" > Password.txt
				echo ""
				read -p "Your Password Has Been Changed, Please Login Back!!" enter
				Login
			else
				read -p "Password is Not the Same!!" enter
				ResetPassword
			fi
		fi
	else
		read -p "Password is Wrong!!" enter
		ResetPassword
	fi
elif [ $CC == 2 ]
then
	MainMenu
else
	read -p "Please Choose Correctly!!"
	ResetPassword
fi
}

DeleteMail() {
clear
cd /home/ballgtodd/Desktop/E-Mail/Account/$email
echo "Do You Want to Delete Inbox or Outbox Mail?"
echo "1. Inbox"
echo "2. Outbox"
echo "3. Back"
read -p "Your Choice : " CC
if [ $CC == 1 ]
then
	echo "Do You Want to Delete it By E-Mail or Stand Alone Mail?"
	echo "1. E-Mail"
	echo "2. Mail"
	echo "3. Back"
	read -p "Your Choice : " CC
	if [ $CC == 1 ]
	then
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Inbox
		InMail=$(cat mail.lst|fzf)
		if [ -d "/home/ballgtodd/Desktop/E-Mail/Account/$email/Inbox/$InMail" ]
		then
			rm -r $InMail
			sed -i "/$InMail/d" mail.lst
			read -p "E-Mail Has Been Deleted..." enter
			MainMenu
		elif [[ $InMail =~ "Back" ]]
		then
			DeleteMail
		fi
	elif [ $CC == 2 ]
	then
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Inbox
		InMail=$(cat mail.lst|fzf)
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Inbox/$InMail
		Mail=$(cat sub.lst|fzf)
		if [[ $Mail =~ "Back" ]]
		then
			DeleteMail
		else
			rm "$Mail"
			sed -i "/$Mail/d" sub.lst
			read -p "Mail Has Been Deleted..." enter
			MainMenu
		fi
	elif [ $CC == 3 ]
	then
		DeleteMail
	else
		echo "Not an Option"
		read enter
		DeleteMail	
	fi
elif [ $CC == 2 ]
then
	echo "Do You Want to Delete it By E-Mail or Stand Alone Mail?"
	echo "1. E-Mail"
	echo "2. Mail"
	echo "3. Back"
	read -p "Your Choice : " CC
	if [ $CC == 1 ]
	then
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
		OutMail=$(cat mail.lst|fzf)
		if [ -d "/home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$OutMail" ]
		then
			rm -r $OutMail
			sed -i "/$OutMail/d" mail.lst
			read -p "E-Mail Has Been Deleted..." enter
			MainMenu
		elif [[ $OutMail =~ "Back" ]]
		then
			DeleteMail
		fi
	elif [ $CC == 2 ]
	then
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox
		OutMail=$(cat mail.lst|fzf)
		cd /home/ballgtodd/Desktop/E-Mail/Account/$email/Outbox/$OutMail
		Mail=$(cat sub.lst|fzf)
		if [[ $Mail =~ "Back" ]]
		then
			DeleteMail
		else
			rm "$Mail"
			sed -i "/$Mail/d" sub.lst
			read -p "Mail Has Been Deleted..." enter
			MainMenu
		fi
	elif [[ $CC == 3 ]]
	then
		DeleteMail
	else
		echo "Not an Option"
		read enter
		DeleteMail
	fi
elif [ $CC == 3 ]
then
	MainMenu
else
	echo "Not an Option"
	read enter
	DeleteMail
fi
}

Loading() {
echo -ne '{#####               }( 20%)\r'
sleep 1
echo -ne '{##########          }( 50%)\r'
sleep 1
echo -ne '{####################}(100%)\r'
echo -ne '\n'
}

Loading2() {
echo -ne '{##                  }( 10%)\r'
sleep 1
echo -ne '{####                }( 20%)\r'
sleep 1
echo -ne '{########            }( 40%)\r'
sleep 1
echo -ne '{##########          }( 50%)\r'
sleep 1
echo -ne '{############        }( 60%)\r'
sleep 1
echo -ne '{##############      }( 70%)\r'
sleep 1
echo -ne '{##################  }( 90%)\r'
sleep 1
echo -ne '{####################}(100%)\r'
echo -ne '\n'
}

Guide() {
clear
random=$(cat /dev/urandom | tr -dc 'A-Z0-9' | fold -w ${1:-8} | head -n 1)
echo "Welcome to the E-Mail Help Guide!!"
echo "If You Want to Contact Our Customer Service, Please Follow Instruction Bellow : "
echo ""
read -p "First, Input Your E-Mail : " mail

if [ -d "/home/ballgtodd/Desktop/E-Mail/Account/$email" ]
then
	read -p "E-Mail Exists" enter
	echo "Generating Your Code ..."
	Loading
	echo ""
	read -p "Code Generated : $random"
	echo "Please Contact Our Customer Service at 1500-505-8008"
	echo "You Will be Asked to Input the Code"
	echo "After You Input the Code, a Message Will Appear to Reset Your Password"
	echo "Follow the Link in the Message to Proceed"
	read enter
	read -p "Is There Anything Else? (Y/N) : " CC
	if [[ $CC =~ Y ]] || [[ $CC =~ y ]]
	then
		Login
	elif [[ $CC =~ N ]] || [[ $CC =~ n ]]
	then
		exit
	else
		echo "Choose Correctly!!"
		read enter
		Guide
	fi
else
	echo "E-Mail Doesn't Exist!!"
	read enter
	Guide
fi
}

printf '\033[8;25;90t'
Login
