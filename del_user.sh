USERNAME=$1

echo "del user"
pure-pw userdel ${USERNAME}
pure-pw mkdb
