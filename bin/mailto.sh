#!/bin/sh

# open Gmail in a new tab of the default browser and compose a new message
# to the specified email address

email=$(echo $1 | sed 's/mailto://')

# if no email address is specified, open Gmail in the default browser
if [ -z "$email" ]; then
    xdg-open "https://mail.google.com/mail/u/0/#inbox"
else
    xdg-open "https://mail.google.com/mail/?view=cm&fs=1&to=$email"
fi

# exit
exit 0
