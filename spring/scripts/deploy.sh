#!/bin/bash

mvn clean package

echo 'Copy files...'

sudo scp -i ~/.ssh/id_rsa_saparbi \
    target/rest-0.0.1-SNAPSHOT.jar \
    root@joinparty.ru:/root

echo 'Restart server...'

sudo ssh -tt -i ~/.ssh/id_rsa_saparbi joinparty.ru << EOF
pgrep java | xargs kill -9
nohup java -jar ~/rest-0.0.1-SNAPSHOT.jar > ~/log.txt &
EOF

echo 'Bye'