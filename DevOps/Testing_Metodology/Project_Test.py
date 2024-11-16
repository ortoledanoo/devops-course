import requests

def test_webapp_reachability():
    url = ("http://__PutMyAWSInstanceIpHere!__/")
    try:
        response = requests.get(url)
        assert response.status_code == 200
        print("Test Passed! Website is Available")
    except requests.exceptions.RequestException as error:
        print("Test FAILED! Website is Not Available")
        print(f"Error Details -> {error}")

test_webapp_reachability()