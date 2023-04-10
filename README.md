# FOGUS-5G-SIEM-add-on
An application made by [Fogus Innovations & Services](https://fogus.gr/) for connecting a vertical application with 5G network core.

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#built-with">Installations</a></li>
    <li><a href="#built-with">Setup</a></li>
    <li><a href="#built-with">Examples With</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- Body -->
<!-- ## Table of contents
* [Introduction](#introduction)
* [Installations](#installations)
* [Setup](#setup)
* [Examples](#examples)
* [License](#license) -->

## About The Project


## Installations

### Install CAPIF

Follow the instructions at:

### Install NEF Emulator

Follow the instructions at: https://github.com/EVOLVED-5G/NEF_emulator

### Install EVOLVED-5G CLI & SDK

Follow the instructions at: https://github.com/EVOLVED-5G/SDK-CLI

### Install Docker (version

### Install jq (optional)

```bash
sudo apt install -y jq
```

## Setup

### Configure environmental variables 
Edit [env_to_copy.dev](./env_to_copy.dev)

### Deploy FOGUS App 
```bash
git clone https://github.com/fogusinnovations/FOGUS-5G-SIEM-add-on.git
```
```bash
cd FOGUS-5G-SIEM-add-on
```

#### Build and deploy containers
make (run) 

#### Stop and deploy again the containers
make restart

#### Remove and deploy again the containers
make fresh

#### Stop containers
make stop

#### Stop and remove containers
make clean

### Architecture

| Container             | Folder                | Description                                      |
|-----------------------|-----------------------|--------------------------------------------------|
| app_backend_django    | app_backend           | Backend of FOGUS App                             |
| app_frontend_angular  | app_frontend          | Frontend of FOGUS App                            |
| app_postgres          | -                     | DB to store the data                             | 


### Access FOGUS App
#### In your browser, access the following url for the UI (frontend)
```
http://localhost:4200/
```

#### In your browser, access the following url for the UI of Django (backend)
```
http://localhost:8000/
```

## Examples of use cases
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

### Analytics Exposure Callback
#### Example of AnalyticsEventNotification (for Abnormal Behaviour)
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

## License

This project is licensed under the Apache License - see the LICENSE.md file for details
