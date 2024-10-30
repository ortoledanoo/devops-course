# Project Oreview

This Project is a Web Application That Provides a 7-day weather forecast Based on The City Name Provided By The User.
It Use Flask to Handle Web Requests and Caching to Optimize API Usage and Performance.

## Needed Packages

Install Needed Packages
```
pip install -r requirements.txt
```
requirement.txt Created With pipreqs 

## Features

* **Hidden API Key**
* **Logging** - All Events are Logged in weather_app.log to Track Usage, HTTP, Errors and caching.
* **Caching** - Stores Recent Weather Data for 5 Minutes, Reducing the Need To Call The Weather API Too Much Times For Same City Data
* **Rate Limit** - Limit Users For Only ONE Request Per Second
* **Max Connections Limit** - Allows Each Client IP Address Open No More Thean 5 Connections To App

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
The Main Goal Of The Deployment Project is To Handle Multiple Rquests

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/m28m6fTp/drawio.png' border='0' alt='drawio'/></a>

## The Components
1. **Client** - Users Making Request to The Web Application
2. **Nginx** - Reverse Proxy That Receives Client Requests and Forwards Them to the Backend
3. **Gunicorn-WSGI** - WSGI server hosting the Flask application instances
4. **Flask** - The Python-based Web Application Instances
6. **Deployment Environment** - Infrastructure Of The Application (Managed By ESXi), The .py Files and All The Required Files

## Request Workflow
1. Client Send Request to Nginx Reverse Proxy
2. Nginx Forwards Request to Gunicorn WSGI Server
3. Gunicorn Passes The Request To Flask App Instance
4. Flask Processes The Request and Returns the Response to Gunicorn
5. Gunicorn Sends The Response Back to Nginx, Which Returns it To The Client
6. Running Files are Packaged in The Target Environment (Using ESXi To Manage it)

## Benefits
- **Scalability** - Components Can Be Scaled Independently
- **Security** - Nginx acts as a Reverse Proxy Hidding The Servers IP
- **Load Balancing** - Nginx Can Distribute Requests Across Multiple Gunicorn/Flask Instances and Gunicorn Can Create Few Workers For Better Load Balancing



