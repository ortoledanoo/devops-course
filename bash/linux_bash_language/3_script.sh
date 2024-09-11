#!/bin/bash
#Type Mentor Name and Get his Email.
PS3="Please Enter Your Choice: "
declare -A mentors=([Naftali]=naftali@infinitylabs.co.il [Tal]=tal@infinitylabs.co.il [Ilya]=ilya@infinitylabs.co.il [Exit]=NULL)

select name in Naftali Tal Ilya Exit; do
	case $name in
	"Naftali")
		echo ${mentors[Naftali]};;
	"Tal")
		echo ${mentors[Tal]};;
	"Ilya")
		echo ${mentors[Ilya]};;
	"Exit")
		echo "Bye Cute"
		break;;
	*)
		echo "Oops";;
	esac	
done
