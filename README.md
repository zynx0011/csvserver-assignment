CSVServer Assignment – Solution ✅

This repository contains my solution for the Infracloud CSVServer DevOps Challenge.

📌 Assignment Overview

We are given:

A CSV file (input data)

A dockerized web server that reads data from the CSV and displays it

We must run & validate output + dockerize steps properly

📂 Project Structure
.
├── gencsv.sh
├── inputdata
│   └── inputFile
├── docker-compose.yml
└── README.md

🛠️ Steps Performed
✅ Step 1: Clone the repo
git clone https://github.com/infracloudio/csvserver.git
cd csvserver


[Commit Point] — Initial commit after cloning

✅ Step 2: Create CSV file using script

Created gencsv.sh

#!/bin/bash
for i in {0..9}
do
  echo "$i, $((RANDOM % 100))"
done


Make executable & run:

chmod +x gencsv.sh
./gencsv.sh > inputdata/inputFile


[Commit Point] — Added script and generated input file

✅ Step 3: Run CSVServer using Docker
docker run -v "$(pwd)"/inputdata:/csvserver -p 9393:9300 infracloudio/csvserver:latest


Check output in browser:

http://localhost:9393


[Commit Point] — Verified CSV display & docker run instructions

✅ Step 4: Handle Timezone (if required)
docker run -e CSVSERVER_BORDER=Orange -e TZ=Asia/Kolkata \
-v "$(pwd)"/inputdata:/csvserver \
-p 9393:9300 infracloudio/csvserver:latest

✅ Step 5: Create docker-compose.yml
version: "3"
services:
  csvserver:
    image: infracloudio/csvserver:latest
    ports:
      - "9393:9300"
    volumes:
      - ./inputdata:/csvserver
    environment:
      - CSVSERVER_BORDER=Orange


Run:

docker compose up -d


[Commit Point] — Added docker-compose setup

✅ Step 6: Validate Output

Open:

http://localhost:9393


You should see numeric table output ✅

✅ Step 7: Stop/Down Compose
docker compose down
