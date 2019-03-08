#!/bin/sh
distccd --jobs 2 \
        --listen 0.0.0.0 \
        --allow ${DISTCC_ALLOWED_HOST} \
        --log-stderr \
        --no-detach >> /var/log/distccd.log 2>&1
