#!/usr/bin/env bash

set -e


initialise () {
    # get vault token from vault
    echo "Trying to login vault"
    token=$(vault login -method=aws -format=json -token-only role=$VAULT_ROLE)

    # token above is guarded by doublequotes. remove them.
    export VAULT_TOKEN="${token//\"}"

    envconsul -once -config="/root/envconsul-config" sh /root/updateconf.sh
}

initialise