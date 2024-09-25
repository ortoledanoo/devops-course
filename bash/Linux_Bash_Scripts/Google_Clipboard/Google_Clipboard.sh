#!/bin/bash
#Search Clipboard on Google
input=$(xclip -se c -o)
echo "Searching for : $input"
    open "https://www.google.com/search?q=$input"
echo "https://www.google.com/search?q=$input"

#Another Way:
#sudo apt install googler
#have google on terminal, try to use it 
#syntax: googler [search term]

