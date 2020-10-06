import syslog_client
import os

from flask import Flask

app = Flask(__name__)
os.mknod('/tmp/server_started')

log = syslog_client.Syslog()


@app.route('/', methods=["GET"])
def generate_syslog():
    log.send("local testing message", syslog_client.Level.WARNING)
    return "Generating log"
