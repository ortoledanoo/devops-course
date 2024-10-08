#!/bin/bash

#Reviewed By Yaaf

echo "Hello, Please Enter Service Name"
read service_name

sudo systemctl status $service_name #Show Status
status=$?


PS3="Select the operation: "

select opt in Start Stop Status Exit
do

  case $opt in
    Start)
      if [ $status -eq 0 ] # if Exit Status is 0 so Only Restart
      then
	 echo "Service Active, Restart Service"
         sudo systemctl restart $service_name
      else # else - Start and Enable
         echo "Start Service $service_name"
         sudo systemctl start $service_name
         sudo systemctl enable $service_name
      fi
      ;;
    Stop)
      sudo systemctl stop $service_name
      ;;
    Status)
      sudo systemctl status $service_name
      ;;
    Exit)
      break
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
  sudo systemctl is-active --quiet $service_name #Check Exit Status Every Loop
  status=$?

done

