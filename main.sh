#!/bin/bash

logged_in=0

while true
do
    if [ $logged_in -eq 0 ]
    then
        source ./menu/main_menu.sh
        main_menu
    else
        source ./menu/user_menu.sh
        user_menu
    fi
done
