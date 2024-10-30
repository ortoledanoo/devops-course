# Project Oreview

This project is a Web Application That Provides a 7-day weather forecast Based on The City Name Provided By The User.
It Use Flask to Handle Web Requests and Caching to Optimize API Usage and Performance.

## Needed Pacages

Install Needed Packages
```
pip install -r requirements.txt
```
requirement.txt Created With pipreqs 

## Features

* **Hidden API Key**
* **Logging** - All Events are Logged in weather_app.log to Track Usage, HTTP, Errors and caching.
* **Caching** - Stores Recent Weather Data for 5 Minutes, Reducing the Need To Call The Weather API Too Much Times For Same City Data

# Worklow

##  1. First Page Load
* User Open Browser To WebAPP
* Browser ---GET---> Server "/"
* Server Return -> home.html
* Browser ---GET---> Server "/static/style.css"

## 2. User Interaction
* User Type "jerusalem" In Search Box
* User Click "Search" Button
* Browser ---POST---> Server -> "/get_weather" With ```{city: "jerusalem"}```

## 3. Cache Check
* Server Creates Cache Key -> "weather_jerusalem"
* IF Data in Cache:
*    Use Cache
* IF NOT in Cache:
*    Server ---GET---> Weather API
*    Weather API Returns JSON
*    Server Saves Cache (For 5 minutes)

## 4. Return Results

### A. Server Processing
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
   

### B. Template Rendering
* Server Uses result.html To Show Result:
* 1. Show City Name ("Jerusalem")
* 2. Show Full Address ("Jerusalem, Israel")
* 3. Show Forecast For 7 days:
*    - Converts Date To Day in Week ("Saturday")
*    - Show Date ("2024-10-26")
*    - Show Day Temp ("15°C")
*    - Show Max Temp ("25°C")
*    - Show Humidity ("60%")

### C. Response Sending
* 1. Server Completes The POST Request
* 2. Sends The Fully Rendered result.html
* 3. Browser Receives and Displays The Page
* 4. Browser GET request for style.css

## 5. Back Home
* Click "Back to Home" button:
*    Browser ---GET---> Server: "/"
*    Returns to Search Page

# Deployment Workflow

### The Components
1. **Client** - Users Making Request to The Web Application
2. **Nginx** - Reverse Proxy That Receives Client Requests and Forwards Them to the Backend
3. **Gunicorn-WSGI** - WSGI server hosting the Flask application instances
4. **Flask** - The Python-based Web Application Instances
6. **Deployment Environment** - Infrastructure Of The Application (Managed By ESXi), The .py Files and All The Required Files

## Deployment Process
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
