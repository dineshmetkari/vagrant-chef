#!/usr/bin/env bash
vagrant plugin install vagrant-env

touch .env

echo VM_MEMORY=VALUE >> .env
echo VM_CPU_COUNT=VALUE >> .env
echo VM_HOSTNAME=VALUE >> .env
