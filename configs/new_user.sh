USERNAME=$1
PASSWORD=$2
_UID=1000
_GID=1000



docker exec -i pure-ftpd mkdir -p /opt/$USERNAME

echo -e "$PASSWORD\n$PASSWORD\n" | docker exec -i pure-ftpd pure-pw useradd $USERNAME -u ftpuser -d /opt/$USERNAME

if [ "$?" -eq 0 ]; then
        docker exec -i pure-ftpd chown -R $_UID:$_GID /opt/$USERNAME
        docker exec -i pure-ftpd pure-pw mkdb
fi
