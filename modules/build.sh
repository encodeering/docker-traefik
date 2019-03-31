#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.9" "alpine:3.9"

docker-build "$PROJECT/alpine"

docker-verify version | dup | matches "Version:[[:space:]]+${VERSION}"
