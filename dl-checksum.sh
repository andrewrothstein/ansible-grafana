#!/usr/bin/env sh

DIR=~/Downloads
MIRROR=https://dl.grafana.com/oss/release

dl() {
    ver=$1
    os=$2
    arch=$3
    local file=grafana-$ver.$os-$arch.tar.gz
    local lfile=$DIR/$file
    local url=$MIRROR/$file
    printf "  # %s\n" $url

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    dl $ver linux amd64
}

dl_ver ${1:-6.4.4}
