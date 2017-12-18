# get current window id & its process id.
wid=`xdotool getwindowfocus`
pid=`xdotool getwindowfocus getwindowpid`
# checks if a xournal window is focused.
function isfocused {
    exe=`readlink -f /proc/$pid/exe`
    if [ $exe = `which xournal` ]
    then
	echo "y"
    else
	echo "n"
    fi
}
# execute keystroke control-shift-<arg>
function keystroke {
  keystroke="control+shift+"$1
  xdotool windowactivate --sync $wid key $keystroke
}

if [ $(isfocused) = "y" ]
then
  echo "PID: $pid | WID: $wid"
  case $1 in
    ruler)      keystroke L ;;
    marker)     keystroke H ;;
    selrect)    keystroke R ;;
    selarea)    keystroke G ;;
    shiftvert)  keystroke V ;;
    pencil)     keystroke P ;;
    ereaser)    keystroke E ;;
    image)      keystroke I ;;
    text)       keystroke T ;;
  esac
fi
