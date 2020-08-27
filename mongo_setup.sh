#!/bin/bash
echo "sleeping for 10 seconds"
sleep 30

echo mongo_setup.sh time now: `date +"%T" `

mongo --host mongo1 <<EOF
  var cfg = {
  "_id": "rs0",
  "members": [
      {
        "_id": 0,
        "host": "mongo1",
	      "priority": 2,
      },
      {
        "_id": 1,
        "host": "mongo2",
	      "priority": 1,
      },
      {
        "_id": 2,
        "host": "mongo3",
	      "priority": 1,
      }
    ]
  };

  rs.initiate(cfg);
EOF
