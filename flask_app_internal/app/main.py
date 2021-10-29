import sys
import os


def app(env, start_response):
    version = "{}.{}".format(sys.version_info.major, sys.version_info.minor)
    start_response("200 OK", [("Content-Type", "text/plain")])
    message = "Hello World from a default Python {} app in a Docker container, with Meinheld and Gunicorn (default)".format(
        version
    )
    if os.getenv('APP_LOCATION'):
        message = message + F" app-location:{os.getenv('APP_LOCATION')}"
    if os.getenv('ENVIRONMENT'):
        message = message + F". You are currently in {os.getenv('ENVIRONMENT')} environment."
    if os.getenv('DEPLOYED_CITY'):
        message = message + F" The app was deployed in city {os.getenv('DEPLOYED_CITY')}"
    return [message.encode("utf-8")]