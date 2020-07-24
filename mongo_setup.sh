#!/bin/bash
echo "sleeping for 10 seconds"
sleep 10

echo mongo_setup.sh time now: `date +"%T" `

mongo --host mongo1:27017 <<EOF
  var cfg = {
  "_id": "rs0",
  "members": [
      {
        "_id": 0,
        "host": "mongo1:27017"
      },
      {
        "_id": 1,
        "host": "mongo2:27018"
      },
      {
        "_id": 2,
        "host": "mongo3:27019"
      }
    ]
  };
  
  rs.initiate(cfg);
EOF
