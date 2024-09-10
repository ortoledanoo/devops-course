#!/bin/bash

input=$(xclip -se c -o)
echo "Searching for : $input"
    open "https://www.google.com/search?q=$input"
echo "https://www.google.com/search?q=$input"
#sudo apt install googler
#have google on terminal, try to use it 
#syntax: googler [search term]
#
#bye
