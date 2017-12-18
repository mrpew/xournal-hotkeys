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

# execute keystroke <arg>
function keystroke{
  keystroke=$1
  xdotool windowactivate --sync $wid key $keystroke
}
# execute keystroke control-<arg>
function keystroke_cntrl{
  keystroke="control+"$1
  xdotool windowactivate --sync $wid key $keystroke
}
# execute keystroke control-shift-<arg>
function keystroke_cntrl_shif {
  keystroke="control+shift+"$1
  xdotool windowactivate --sync $wid key $keystroke
}



if [ $(isfocused) = "y" ]
then
  case $1 in
    # tools
    ruler)      keystroke_cntrl_shif L ;;
    autoshape)  keystroke_cntrl_shif S ;;
    # selection
    selrect)    keystroke_cntrl_shif R ;;
    selarea)    keystroke_cntrl_shif G ;;
    shiftvert)  keystroke_cntrl_shif V ;;
    hand)       keystroke_cntrl_shif A ;;
    # drawing
    pencil)     keystroke_cntrl_shif P ;;
    ereaser)    keystroke_cntrl_shif E ;;
    marker)     keystroke_cntrl_shif H ;;
    text)       keystroke_cntrl_shif T ;;
    image)      keystroke_cntrl_shif I ;;
    # settings
    font)       keystroke_cntrl_shif F ;;
    # navigation
    firstpg)    keystroke_cntrl Home  ;;
    prevpg)     keystroke_cntrl Left  ;;
    nextpg)     keystroke_cntrl Right ;;
    lastpg)     keystroke_cntrl End   ;;
    # view
    fullscreen) keystroke F11 ;;
    # edit
    undo)       keystroke_cntrl Z ;;
    redo)       keystroke_cntrl Y ;;
    cut)        keystroke_cntrl X ;;
    copy)       keystroke_cntrl C ;;
    paste)      keystroke_cntrl V ;;
    delete)     keystroke Delete  ;;
    # file
    new)        keystroke_cntrl N ;;
    open)       keystroke_cntrl O ;;
    save)       keystroke_cntrl S ;;
    print)      keystroke_cntrl P ;;
    exprt)      keystroke_cntrl E ;;
    quit)       keystroke_cntrl Q ;;
  esac
fi
