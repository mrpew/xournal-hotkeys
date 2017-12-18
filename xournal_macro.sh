function isfocused {
    pid=`xdotool getwindowfocus getwindowpid`
    exe=`readlink -f /proc/$pid/exe`
    if [ $exe = `which xournal` ]
    then
	echo "y"
    else
	echo "n"
    fi
}

isfocused
