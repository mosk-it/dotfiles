#! /usr/bin/bash

KEY_BINDINGS='\[\]\;\:\"\,\.\<\>\/\?wqertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM\)\(\*\&\^\%\$\#\@\!\)';

# if anyone's uses more t/T than f, just copy two lines below and duplicate
# the content of loop changing "jump" to "jump-to"

tmux bind -Tcopy-mode-vi 'f' switch-client -Tcopy-mode-jumps-forward ;
tmux bind -Tcopy-mode-vi 'F' switch-client -Tcopy-mode-jumps-backward ;
tmux bind -Troot "^_" copy-mode \; switch-client -Tcopy-mode-vi ;

for KEY in `echo $KEY_BINDINGS | sed -e 's/\(.\)/\1\n/g'`; do
    tmux bind -Tcopy-mode-jumps-forward "$KEY" send -X jump-forward "$KEY";
    tmux bind -Tcopy-mode-jumps-backward "$KEY" send -X jump-backward "$KEY";
done
