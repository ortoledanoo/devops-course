#!/bin/bash
#Translate Script Used By Google Translate
PS3="This is Translator"
input=$(xclip -se c -o)
select opt in ENG-HE HE-ENG Quit
do
	case $opt in
	"ENG-HE")
		echo "Translating : $input"
    		open "https://translate.google.com/?sl=en&tl=iw&text=$input&op=translate"
		;;
	"HE-ENG") 
		echo "Translating : $input"
		open "https://translate.google.com/?sl=iw&tl=en&text=$input&op=translate"
		;;
	"Quit")
		echo "Bye Bye"
		break;
		;;
	*)
		echo "Oops"
		;;
	esac

done
