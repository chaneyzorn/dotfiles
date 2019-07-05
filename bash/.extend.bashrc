#
# ~/.extend.bashrc
#

# ex - archive extractor
# usage: ex <file>
function ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


function _get_keyboard_id {
    keyboard_id=$(xinput list | grep AT | awk -F '=' '{ print $2 }' | awk '{ print $1 }')
    echo $keyboard_id
}


# dk - disable laptop keyboard
function dk () {
    keyboard_id=$(_get_keyboard_id)
    xinput disable $keyboard_id
}


# ek - enable laptop keyboard
function ek () {
    keyboard_id=$(_get_keyboard_id)
    xinput enable $keyboard_id
}

