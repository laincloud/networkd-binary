#!/bin/sh

exec_cmd()
{
    $1
    if [ $? -ne 0 ]; then
        echo "ERROR - $1 failed!"
        if [ "$2" == "clear" ]; then
            rm -rf $ROOT/dist
        fi
        exit 1
    fi
}

ROOT=`pwd`

mkdir dist

# build networkd
cd ${ROOT}
mkdir -p dist/lain/networkd
exec_cmd "docker build --no-cache -t networkd -f dockerfiles/networkd.df ."
exec_cmd "docker create --name networkd-instance networkd"
exec_cmd "docker cp networkd-instance:/tmp/networkd.git/networkd ${ROOT}/dist/lain/networkd/"
docker rm -f networkd-instance

exec_cmd "docker build --no-cache -t networkd-binary -f dockerfiles/binary.df ."
