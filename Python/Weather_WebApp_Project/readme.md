# Project Oreview

This project is a web application that provides a 7-day weather forecast based on the city name provided by the user.
It use flask to handle web requests and caching to optimize api usage and performance.

## Needed Packages

Install needed packages
```
pip install -r requirements.txt
```
requirement.txt created with 'pipreqs'

## Features

* **Hidden API Key**
* **Logging** - All events are logged in weather_app.Log to track usage, http, errors and caching.
* **Caching** - Stores recent weather data for 5 minutes, reducing the need to call the weather api too much times for same city data.
* **Rate Limit** - Limit users for only one request per second.
* **Max Connections Limit** - Allows each client ip address open no more thean 5 connections to app.

# Workflow

###  1. First Page Load
User Open Browser To WebApp\
Browser ---GET---> Server "/"\
Server Return -> home.html\
Browser ---GET---> Server "/static/style.css"

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/GpkYVGk3/Screenshot-2024-10-30-at-17-35-10.png' border='0' alt='Screenshot-2024-10-30-at-17-35-10'/></a>

### 2. User Interaction
User Type "jerusalem" In Search Box\
User Click "Search" Button\
Browser ---POST---> Server -> "/get_weather" With ```{city: "jerusalem"}```

### 3. Cache Check
Server Creates Cache Key -> "weather_jerusalem"\
IF Data in Cache:\
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Use Cache\
 IF NOT in Cache:\
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Server ---GET---> Weather API\
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Weather API Returns JSON\
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Server Saves Cache (For 5 minutes)



### 4. Return Results

#### A. Server Processing
* Takes Weather Data (JSON) and Filter
    ```
    response = {
       "days": [ ---> Array Of 7 Elements (Days)
           {
               "datetime": "2024-10-26", ---> Date (Convert To Day in Week)
               "tempmin": "15", ---> Night (add C)
               "tempmax": "25", ---> Day (add C)
               "humidity": "60" ---> (ADD %)
           },
       ],
       "address": "Jerusalem", ---> City
       "resolvedAddress": "Jerusalem, Israel" ---> Country
    }
    ```
    * Data (JSON) Translated For This README From - https://jsonviewer.stack.hu/
   

#### B. Template Rendering
 Server Uses result.html To Show Result
* Show City Name ("Jerusalem")
* Show Full Address ("Jerusalem, Israel")
* Show Forecast For 7 Days\
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Converts Date To Day in Week ("Saturday")\
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Date ("2024-10-26")\
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Night Temp ("15°C")\
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Day Temp ("25°C")\
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show Humidity ("60%")

#### C. Response Sending
Server Completes The POST Request\
Sends The Fully Rendered result.html\
Browser Receives and Displays The Page\
Browser GET request for style.css

### 5. Back Home
Click "Back to Home" button:\
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Browser ---GET---> Server: "/"\
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Returns to Search Page

# Deployment Workflow
## Oreview
This project showcases a scalability and reliability web application deployment using nginx, gunicorn, and flask
With caching and rate-limit to efficiently handle api calls and user requests simultaneously

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/m28m6fTp/drawio.png' border='0' alt='drawio'/></a>

## The Components
1. **Client** -  Users making request to the web application.
2. **Nginx** - Reverse proxy that receives client requests and forwards them to the backend.
3. **Gunicorn-WSGI** - Server that runs multiple instances of the flask app, allowing it to handle more requests at the same time.
4. **Flask** - The actual python application that processes user requests and returns the weather data.
6. **Deployment Environment** - Infrastructure of the application (managed by esxi), includes the .Py files and all the required files.

## Request Workflow
1. Client send request to nginx reverse proxy.
2. Nginx forwards request to gunicorn wsgi server.
3. Gunicorn passes the request to flask app instance.
4. Flask processes the request and returns the response to gunicorn.
5. Gunicorn sends the response back to nginx, which returns it to the client.
6. Running files are packaged in the target environment (using esxi to manage it).

## benefits
- **Scalability** - Components can be scaled independently.
- **Security** - Nginx acts as a reverse proxy hidding the servers ip.
- **Load Balancing** - Nginx can distribute requests across multiple gunicorn/flask.instances and gunicorn can create few workers for better load balancing.


