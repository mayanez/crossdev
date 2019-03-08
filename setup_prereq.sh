#!/bin/bash

echo "Configure binfm-support..."
docker run --rm --privileged multiarch/qemu-user-static:register --reset
