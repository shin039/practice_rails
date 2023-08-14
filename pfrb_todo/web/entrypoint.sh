#!/bin/bash
set -e

rm -f /tasks/tmp/pids/server.pid

exec "$@"
