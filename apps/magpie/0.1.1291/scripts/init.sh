#!/bin/bash

# The image runs as the nonroot user (uid 65532) and keeps everything it
# writes under /config, which is bind-mounted from ./data.
mkdir -p data
chown -R 65532:65532 data
