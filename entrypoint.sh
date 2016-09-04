#!/bin/bash
set -e
PULL_REQUESTS="1407 1526"
if df | grep -q /tmp; then
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  go get github.com/influxdata/telegraf
  cd /go/src/github.com/influxdata/telegraf/
  for PR in ${PULL_REQUESTS}; do
    git fetch origin pull/${PR}/head:pr_${PR}
    git merge pr_${PR} -m "merge pull request ${PR}"
  done
  make
  scripts/build.py --package
  cp /go/src/github.com/influxdata/telegraf/build/telegraf /tmp/telegraf_custom
  cp /go/src/github.com/influxdata/telegraf/build/*.tar.gz /tmp/
  cp /go/src/github.com/influxdata/telegraf/build/*.rpm /tmp/
  cp /go/src/github.com/influxdata/telegraf/build/*.deb /tmp/
  chmod a+r /tmp/telegraf_custom /tmp/*.tar.gz /tmp/*.rpm /tmp/*.deb
else
  echo "this image builds and copy a modified version of telegraf, please mount some output directory to /tmp something like -v $PWD:/tmp will suffice"
fi
