# FOGUS-5G-SIEM-add-on
An application made by [Fogus Innovations & Services](https://fogus.gr/) for connecting a vertical application with 5G network core.

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#installations">Installations</a></li>
    <li><a href="#setup">Setup</a></li>
    <li><a href="#examples">Examples</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- Body -->

## About The Project
The [FOGUS-5G SIEM add-on](https://github.com/fogusinnovations/FOGUS-5G-SIEM-add-on) is a standalone application which is developed as a separate software component (a  containerized  Python  application exposing  a  set  of  REST  API  endpoints) communicating with the vertical application and a 5G NPN (by calling  the  exposed  NEF  APIs).
Indicative capabilities of the FOGUS-5G SIEM add-on:

•Receives data from 5G network

•Converts the collected data/logs/events from 5G network, to readable format for the SIEM

•Sends formatted data to SIEM over Https protocol


## Installations

### Install [Docker](https://docs.docker.com/get-docker/)

### Install [Make](https://www.gnu.org/software/make/)

### Install CAPIF

Follow the instructions at:

### Install NEF Emulator

Follow the instructions at: https://github.com/EVOLVED-5G/NEF_emulator

### Install EVOLVED-5G CLI & SDK

Follow the instructions at: https://github.com/EVOLVED-5G/SDK-CLI

### Install jq (optional)

```bash
sudo apt install -y jq
```

## Setup

### Deploy FOGUS App 
```bash
git clone https://github.com/fogusinnovations/FOGUS-5G-SIEM-add-on.git
```
```bash
cd FOGUS-5G-SIEM-add-on
```

### Configure environmental variables 
Edit [env_to_copy.dev](./env_to_copy.dev)

#### Build and deploy containers
```bash
make (run) 
```

#### Stop and deploy again the containers
```bash
make restart
```

#### Remove and deploy again the containers
```bash
make fresh
```

#### Stop containers
```bash
make stop
```

#### Stop and remove containers
```bash
make clean
```

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

## Examples
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

This project is licensed under the Apache License - see the [LICENSE.md](https://github.com/fogusinnovations/FOGUS-5G-SIEM-add-on/blob/main/LICENSE) file for details
