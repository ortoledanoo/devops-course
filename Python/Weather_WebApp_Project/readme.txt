# Project Overview:
# This project is a Web Application That Provides a 7-day weather forecast Based on The City Name Provided By The User.
# It Use Flask to Handle Web Requests, With Rate Limiting and Caching to Optimize API Usage and Performance.

# Install Needed Packages:
#    pip install -r requirements.txt
# requirement.txt Created With pipreqs 

# Features:
# - Rate Limiting - Limits Users to a Maximum of 10 Requests Per Minute to Prevent API Usage Too Much.
# - API Key - Hidden as .env
# - Logging - All Events are Logged in weather_app.log to Track Usage, HTTP, Errors and caching.
# - Caching - Stores Recent Weather Data for 5 Minutes, Reducing the Need To Call The Weather API Too Much Times For Same City Data
# - Error Handling Handles Missing Input, API errors and Too Many Requests (429).
     # 400 - Will Return JSON Data With {'error': ["Details About Error"]}
     # 429 - Will Return Rendered Template requests_limit.html With 429 Status Code (Too Many Requests)


# Flow:
# 1. First Page Load
# User Open Browser To WebAPP
# Browser ---GET---> Server "/"
# Server Return -> home.html
# Browser ---GET---> Server "/static/style.css"

# 2. User Interaction
# User Type "jerusalem" In Search Box
# User Click "Search" Button
# Browser ---POST---> Server -> "/get_weather" With {city: "jerusalem"}

# 3. Server Processing
# Server Receives POST Request
# Server Checks Rate Limiter (Max 10 Requests Per Minute)
# IF Rate Limit Exceeded:
#    Return requests_limit.html With 429 Status Code

# 4. Cache Check
# Server Creates Cache Key -> "weather_jerusalem"
# IF Data in Cache:
#    Use Cache
# IF NOT in Cache:
#    Server ---GET---> Weather API
#    Weather API Returns JSON
#    Server Saves Cache (For 5 minutes)


# 5. Return Results

    # A. Server Processing
    # Takes Weather Data (JSON) and Filter:
    #response = {
    #   "days": [ ---> Array Of 7 Elements (Days)
    #       {
    #           "datetime": "2024-10-26", ---> Date (Convert To Day in Week)
    #           "tempmin": "15", ---> Night (add C)
    #           "tempmax": "25", ---> Day (add C)
    #           "humidity": "60" ---> (ADD %)
    #       },
    #       #... (7 days total)
    #   ],
    #   "address": "Jerusalem", ---> City
    #   "resolvedAddress": "Jerusalem, Israel" ---> Country
    #}

    # B. Template Rendering
    # Server Uses result.html To Show Result:
    # 1. Show City Name ("Jerusalem")
    # 2. Show Full Address ("Jerusalem, Israel")
    # 3. Show Forecast For 7 days:
    #    - Converts Date To Day in Week ("Saturday")
    #    - Show Date ("2024-10-26")
    #    - Show Day Temp ("15°C")
    #    - Show Max Temp ("25°C")
    #    - Show Humidity ("60%")

    # C. Response Sending
    # 1. Server Completes The Original POST Request
    # 2. Sends The Fully Rendered Result.html
    # 3. Browser Receives and Displays The Page
    # 4. Browser GET request for style.css

# 6. Back Home
# Click "Back to Home" button:
#    Browser ---GET---> Server: "/"
#    Returns to Search Page





