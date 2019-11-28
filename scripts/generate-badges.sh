#!/usr/bin/env bash

# Outputs tags to be placed in a github README for build status and
# package version.

REPO_NAME="${PWD##*/}"
REPO_OWNER="${1-eliasnorrby}"
SCOPE="${2-@eliasnorrby}"
STYLE="${3-for-the-badge}"

ERROR="Bad usage, see $0 -h"

read -r -d "" USAGE <<EOF
Create readme tags for build status and package version

Usage: ${0##*/} [-rusxh]
  -r REPO     Specify name of remote repo (default: current directory)
  -o OWNER    Specify the owner of the repo (default: eliasnorrby)
  -s SCOPE    Specify the npm scope of the package (default: @eliasnorrby)
  -x STYLE    Specify the badge style to be used (default: for-the-badge)
  -h          Show usage

Example:
  ${0##*/} -r my-repo -o user123

EOF

set -eo pipefail

while getopts r:o:s:x:h opt; do
  case $opt in
    r) REPO_NAME=$OPTARG                   ;;
    o) REPO_OWNER=$OPTARG                  ;;
    s) SCOPE=$OPTARG                       ;;
    x) STYLE=$OPTARG                       ;;
    h) echo "$USAGE" && exit 0             ;;
    *) echo "$ERROR" && exit 1             ;;
  esac
done

PKG_NAME="$SCOPE/$REPO_NAME"

cat <<EOF
[![Travis](https://img.shields.io/travis/com/$REPO_OWNER/$REPO_NAME?style=for-the-badge)](https://travis-ci.com/$REPO_OWNER/$REPO_NAME)
[![npm](https://img.shields.io/npm/v/$PKG_NAME?style=for-the-badge)](https://www.npmjs.com/package/$PKG_NAME)

[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=$REPO_OWNER/$REPO_NAME)](https://dependabot.com)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
EOF

# Netlify: [![Netlify Status](https://api.netlify.com/api/v1/badges/67dbd163-fcd7-4ea4-8af7-7925bf8c5c7c/deploy-status)](https://app.netlify.com/sites/eliasnorrby-portfolio/deploys)
