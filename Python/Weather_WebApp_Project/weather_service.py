# weather_service.py
import requests

#API Key
import os
from dotenv import load_dotenv
load_dotenv()
api_key = os.getenv("WEATHER_API_KEY")

# Base URL
base_url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline"


class WeatherService:
    def __init__(self, api_key):
        self.api_key = api_key

    def get_forecast(self, city_name):
        """ Get weather forecast from API
        Returns JSON response or error message """

        try:
            # API request parameters
            params = {
                'unitGroup': 'metric',
                'elements': 'datetime,name,address,resolvedAddress,tempmax,tempmin,humidity',
                'include': 'days,fcst',
                'key': self.api_key,
                'contentType': 'json'
            }

            # Make API Call
            response = requests.get(
                f"{base_url}/{city_name}/next7days",
                params=params,
                timeout=10
            )

            # POP Fail For Invalid Access
            response.raise_for_status()
            # Return JSON
            return response.json()

        except requests.RequestException as error_type:
            return {'error': f"Could Not Get Weather Data -  {error_type}"}

        