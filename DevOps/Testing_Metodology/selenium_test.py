from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By #Search Functions
from selenium.webdriver.common.keys import Keys # Press ENTER
import time

# Reviewed By -

### Initialized Process For FireFox
# Set the path to GeckoDriver executable
geckodriver_path = "/usr/local/bin/geckodriver"

# Create a Service object for GeckoDriver
service = Service(geckodriver_path)

# Initialize Firefox WebDriver with the Service object
driver = webdriver.Firefox(service=service)


# Positive Check - Valid City
try:
    driver.get("http://51.17.24.179/")  # My AWS Instance IP

    # Send 'Jerusalem' City Name
    city_input = driver.find_element(By.NAME, "city") # Search Element By Name
    city_input.send_keys("Jerusalem") # Set Input To 'Jerusalem'
    city_input.send_keys(Keys.RETURN) # Press 'Enter'

    # Wait To Load WebResult
    time.sleep(3)

    # Check if Wanted Data Inside
    if "The Weather in Jerusalem" in driver.page_source:
        print("Positive Test Passed!")
    else:
        print("Positive Test FAILED")

except Exception as error:
    print(f"Error in Positive Test {error}")


# Check None Input
try:
    driver.get("http://51.17.24.179/")

    # Clear Input and Send Nothing
    city_input = driver.find_element(By.NAME, "city")
    city_input.clear()
    city_input.send_keys("")
    city_input.send_keys(Keys.RETURN)

    # Wait To Load WebResult
    time.sleep(3)

    # Check if the form is still on the same page (submission blocked)
    current_url = driver.current_url
    if current_url == "http://51.17.24.179/": #Check That I'm Still In HomePage
        print("Empty Input Test Passed! Form submission blocked.")
    else:
        print("Empty Input Test FAILED! Form submission allowed.")

except Exception as error:
    print(f"Error in Empty Input Test: {error}")


# Back To Home Test
try:
    driver.get("http://51.17.24.179/")
    city_input = driver.find_element(By.NAME, "city")
    city_input.send_keys("Jerusalem")
    city_input.send_keys(Keys.RETURN)
    time.sleep(3)

    # Search For Button With 'Back to Home' Text On it
    back_button = driver.find_element(By.LINK_TEXT, "Back to Home")
    # Click Button
    back_button.click()

    time.sleep(2)

    if driver.current_url == "http://51.17.24.179/": # Check We Back Home
        print("Back to Home Button Test Passed!")
    else:
        print("Back to Home Button Test FAILED!")
except Exception as error:
    print(f"Error in Back to Home Button Test {error}")



# Negative Test - Check Not Valid City
try:
    driver.get("http://51.17.24.179/")  # חזרה לעמוד הבית

    # Send Invalid City Name
    city_input = driver.find_element(By.NAME, "city")
    city_input.send_keys("T@!edano1231")
    city_input.send_keys(Keys.RETURN)

    # Wait To Load WebResult
    time.sleep(3)

    # Check For Error Message
    if "Error Finding Weather" in driver.page_source:
        print("Negative Test Passed! Error Message Displayed Successfully")
    else:
        print("Negative Test Failed! Error Message NOT Displayed")

except Exception as error:
    print(f"Error Find Error Message {error}")




# Close Browser
driver.quit()
