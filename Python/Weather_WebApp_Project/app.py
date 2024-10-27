# Files
from weather_service import WeatherService
from config import api_key
from datetime import datetime

# Logging
import logging

# Flask
from flask import Flask, render_template, request, jsonify

# Flask - Caching
from flask_caching import Cache

# Flask - Limiter
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

app = Flask(__name__)

limiter = Limiter(
    app=app,
    # Function to Identify Users by IP
    # So Requests will Count By IP
    key_func=get_remote_address,
    # Use RAM to Store Rate Limit Data
    storage_uri="memory://",
    default_limits=["200 per day", "50 per hour"]
)

# logging Setup
logging.basicConfig(
    filename='weather_app.log',
    level=logging.INFO,
    format='%(asctime)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
    encoding='utf-8'
)

# Create logger
logger = logging.getLogger(__name__)

# Cache is Object of Cache Class.
# Type: simple (can be filesystem or database)
cache = Cache(app, config={'CACHE_TYPE': 'simple'})

# Create WeatherService Object with API key
weather_service = WeatherService(api_key)


def initialize_cache_key(city_name):
    """ Create Cache Key :)
    Args - city_name - User Input City Name From WebAPP
    Return - Cache Key
    Example - Tel Aviv -> telaviv """
    return f'weather_{city_name.lower().strip()}'

# Decorator Calls requests_limit_handler() Automatic When 429 Status Code Arrived
@app.errorhandler(429)
def requests_limit_handler(error): 
    """ Handle  429 HTTP Error (Too Many Requests)
    Logging it And Returning an Error
    Args - error: Error Message For Logging.
    Return - 'requests_limit.html' With a 429 HTTP Status Code.
    """
    logger.warning(f"Requests Limit For IP - {get_remote_address()}")
    return render_template('requests_limit.html'), 429

def get_day_of_week(date_str):
    """ Converts Date String To  Day Of The Week
    Args - date_str: Date 'YYYY-MM-DD'
    Return: Day Name if Success, "Invalid Date" if FAIL"""
    try:
        date_obj = datetime.strptime(date_str, '%Y-%m-%d')
        return date_obj.strftime('%A')
    except ValueError:
        logger.error(f"Date To Day in Week Error {ValueError}")
        return "Invalid Date"


def get_data_from_cache_or_api(city_name):
    """ Get Weather Data From Cache, if Not Available -
     Get it From the API and Store in Cache
    Args city_name - City Name From User (WebAPP)
    Return - Weather Data """
    cache_key = initialize_cache_key(city_name)
    data = cache.get(cache_key)

    # if There is Data Assign To cache_key...
    if data:
        logger.info(f"Cache HIT - Retrieved Data From Cache For - {city_name}")
    else:
        logger.info(f"Cache MISS - Getting New Data From API For - {city_name}")

        # Get Data From API Using Weather Service
        data = weather_service.get_forecast(city_name)

        # Set New cache_key With Data Pulled From API
        cache.set(cache_key, data, timeout=300)
        logger.info(f"Saved New Data To Cache For - {city_name} (Will Be Saved For 5 Minutes)")

    return data


@app.route('/')
def home():
    """ Route To The Home Page """
    return render_template('home.html')


@app.route('/get_weather', methods=['POST'])
@limiter.limit("10 per minute")  # Override the default limit
def get_weather():
    """ Main Function, Handles the Request For city, Manages Caching & Error Handling
    Return - Render 'result.html' With Requested Data OR an Error """
    #Data From WebAPP
    city_name = request.form.get('city')

    if not city_name:
        logger.error("City Name Not Provided")
        return jsonify({'error': 'City Name Is Required!'}), 400

    try:
        logger.info(f"Starting Weather Request For - {city_name}")
        data = get_data_from_cache_or_api(city_name)

        if 'error' in data:
            logger.error(f"API Error For City {city_name}: {data['error']}")
            return render_template("result.html", error=data['error'])

        logger.info(f"Successfully Returning Weather Data For: {city_name}")
        return render_template(
            "result.html",
            api_data=data,
            city=data["address"],
            country=data["resolvedAddress"],
            get_day_of_week=get_day_of_week
        )

    except Exception as any_error:
        logger.error(f"Unexpected Error - {any_error}")
        return render_template("result.html", error="An Unexpected Error Occurred")


if __name__ == "__main__":
    app.run(debug=True)