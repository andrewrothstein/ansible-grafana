#!/usr/bin/env sh

DIR=~/Downloads
MIRROR=https://dl.grafana.com/oss/release

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tar.gz}
    local platform="${os}-${arch}"
    local file="grafana-${ver}.${platform}.${archive_type}"
    local lfile=$DIR/$file
    local url=$MIRROR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver windows amd64 zip
}

dl_ver ${1:-6.6.2}
