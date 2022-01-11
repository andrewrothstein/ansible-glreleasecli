#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://gitlab.com/gitlab-org/release-cli/-/releases

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local dotexe=${4:-""}
    local platform="${os}-${arch}"
    local rfile=release-cli-${platform}${dotexe}
    local lfile=$DIR/release-cli-${ver}-${platform}${dotexe}
    local url=$MIRROR/v$ver/downloads/bin/${rfile}
    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver freebsd 386
    dl $ver freebsd amd64
    dl $ver freebsd arm
    dl $ver linux 386
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver linux ppc64le
    dl $ver windows 386 .exe
    dl $ver windows amd64 .exe
    dl $ver darwin amd64
}

dl_ver ${1:-0.10.0}
