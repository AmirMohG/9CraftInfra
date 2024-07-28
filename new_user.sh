USER_ID=$1
USERNAME=$2
PASSWORD=$3
WORLD_NAME=$4
_UID=1001
_GID=1001


#new_user.sh {user_id} {username} {password} {world_name}
echo "Making dir"
mkdir -p /opt/$USER_ID/$WORLD_NAMEA/world

echo "Making user"
echo -e "$PASSWORD\n$PASSWORD\n" | pure-pw useradd ${USERNAME} -u ftpuser -d /opt/$USER_ID/$WORLD_NAME/world

echo "Chown"
if [ "$?" -eq 0 ]; then
chown -R $_UID:$_GID /opt/$USER_ID/$WORLD_NAME
pure-pw mkdb
fi
