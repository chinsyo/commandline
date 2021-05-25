#! /bin/bash

# clear the screen
tput clear

# save cursor position
tput sc

# move cursor position
tput cup 10 13

# hide cursor
tput civis

# show cursor
tput cnorm

# show output
tput rc
