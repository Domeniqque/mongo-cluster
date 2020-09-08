#!/bin/bash

echo "**********************************************"
echo "Waiting for startup.."

until curl http://mongo1:27017/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 2
done

until curl http://mongo2:27017/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 2
done

echo mongo_setup.sh time now: `date +"%T" `

mongo --host mongo1:27017 <<EOF
  var cfg = {
  "_id": "rs0",
  "writeConcernMajorityJournalDefault" : true,
  "members": [
      {
        "_id": 0,
        "host": "mongo1:27017",
	      "priority": 2,
      },
      {
        "_id": 1,
        "host": "mongo2:27017",
	      "priority": 0,
      }
    ],
    settings: {
      chainingAllowed: true
    }
  };

  rs.initiate(cfg, { force: true });
  rs.reconfig(cfg, { force: true });
  rs.slaveOk();
  db.getMongo().setReadPref('nearest');
  db.getMongo().setSlaveOk();
EOF
