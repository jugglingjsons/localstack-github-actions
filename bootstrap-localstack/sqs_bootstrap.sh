#!/usr/bin/env bash

set -euo pipefail

# enable debug
# set -x

echo "configuring sqs"
echo "==================="
LOCALSTACK_HOST=localhost
LOCALSTACK_PORT=4566
AWS_REGION=eu-west-1

MAIN_QUEUE_NAME="test-queue"

create_queue() {
    local QUEUE_NAME_TO_CREATE=$1
    awslocal --endpoint-url=http://${LOCALSTACK_HOST}:${LOCALSTACK_PORT} sqs create-queue --queue-name ${QUEUE_NAME_TO_CREATE} --region ${AWS_REGION}
}


create_queue "${DLQ_QUEUE}"
create_queue "${MAIN_QUEUE_NAME}"
