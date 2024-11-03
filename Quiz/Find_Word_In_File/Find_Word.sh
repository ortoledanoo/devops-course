#!/bin/bash
# Reviewed By Kobi
word=$1
sudo grep -rli "$word" /home
