#!/bin/sh

/opt/enigmatica2/run-command start

trap "/opt/enigmatica2/run-command stop" SIGINT SIGTERM

sleep 5

tail -F /opt/enigmatica2/logs/latest.log& wait
