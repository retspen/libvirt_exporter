#!/bin/sh

docker run -i -v `pwd`:/gopath/src/github.com/kumina/libvirt_exporter centos:8.1.1911 /bin/bash << 'EOF'
set -ex

dnf install -y epel-release
dnf install -y libvirt-devel golang git

cd /gopath/src/github.com/kumina/libvirt_exporter
export GOPATH=/gopath
go get -d ./...
go build --ldflags 'LDFLAGS=-L/usr/lib64 -extldflags "-static"'
strip libvirt_exporter
EOF
