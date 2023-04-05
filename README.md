# FOGUS-5G-SIEM-add-on

## Table of contents
* [Intorduction](#introduction)
* [Technologies](#technologies)
* [Installations](#installations)
* [Setup](#setup)

## Introduction

## Technologies
Project is created with:
* Python version: 3.8.10
* Node.js version: 16.15.0

## Installations

### Install CAPIF

Follow the instructions at:

### Install NEF Emulator

Follow the instructions at:
https://github.com/EVOLVED-5G/NEF_emulator

### Install jq (optional)

```bash
sudo apt install -y jq
```

## Setup

### Configure environmental variables 
Edit [env_to_copy.dev](./env_to_copy.dev)


### Deploy FOGUS App 

# Deploy the FOGUS App
cd FOGUS-5G-SIEM-add-on

# Build and deploy containers
make (run) 

# Stop and deploy again the containers
make restart

# Remove and deploy again the containers
make fresh

# Stop containers
make stop

# Stop and remove containers
make clean
```

### Architecture

| Container             | Folder                | Description                                      |
|-----------------------|-----------------------|--------------------------------------------------|
| app_backend_django    | app_backend           | Backend of FOGUS App                             |
| app_frontend_angular  | app_frontend          | Frontend of FOGUS App                            |
| app_postgres          | -                     | DB to store the data                             | 


### Access FOGUS App
#### In your browser, access the following url
```
http://localhost:4200/
```




### Monitoring Event Callback
#### Example of MonitoringEventReport
```json
{
  "externalId": "123456789@domain.com",
  "monitoringType": "LOCATION_REPORTING",
  "locationInfo": {
    "cellId": "string",
    "enodeBId": "string"
  },
  "ipv4Addr": "string"
}
```

## Analytics Exposure Callback
### Example of AnalyticsEventNotification (for Abnormal Behaviour)
```json
{
  "notifId": "notif1",
  "analyEventNotifs": [
    {
      "analyEvent": "ABNORMAL_BEHAVIOR",
      "expiry": "2021-11-26T09:21:04.481Z",
      "timeStamp": "2021-11-26T09:21:04.481Z",
      "abnormalInfos": [
        {
          "gpsis": [
            "string"
          ],
          "appId": "string",
          "excep": {
            "excepId": "SUSPICION_OF_DDOS_ATTACK",
            "excepLevel": 0,
            "excepTrend": "UP"
          },
          "ratio": 100,
          "confidence": 0,
          "addtMeasInfo": {
            "ddosAttack": {
              "ipv4Addrs": [
                "198.51.100.1"
              ]
            }
          }
        }
      ]
    }
  ]
}
```

### Exceptions ('excep' field) for Abnormal Behaviour
| excepId  | Description |
| ------------- | ------------- |
| UNEXPECTED_UE_LOCATION  | Unexpected UE location  |
| UNEXPECTED_LONG_LIVE_FLOW  | Unexpected long-live rate flows  |
| UNEXPECTED_LARGE_RATE_FLOW | Unexpected large rate flows  |
| UNEXPECTED_WAKEUP  | Unexpected wakeup  |
| SUSPICION_OF_DDOS_ATTACK  | Suspicion of DDoS attack  |
| WRONG_DESTINATION_ADDRESS  | Wrong destination address  |
| TOO_FREQUENT_SERVICE_ACCESS  | Too frequent Service Access  |
| UNEXPECTED_RADIO_LINK_FAILURES  | Unexpected radio link failures  |
| PING_PONG_ACROSS_CELLS  | Ping-ponging across neighbouring cells  |